# encoding: utf-8
require 'ffi-rzmq'
require "logstash/namespace"

class LogStash::PluginMixins::ZeroMQContext
  class << self
    def context
      @context ||= ZMQ::Context.new
    end
  end
end

module LogStash::PluginMixins::ZeroMQ
  # LOGSTASH-400
  # see https://github.com/chuckremes/ffi-rzmq/blob/master/lib/ffi-rzmq/socket.rb#L93-117
  STRING_OPTS = %w{IDENTITY SUBSCRIBE UNSUBSCRIBE}

  def context
    LogStash::PluginMixins::ZeroMQContext.context
  end

  def terminate_context
    context.terminate
  end

  def setup(socket, address)
    if server?
      error_check(socket.bind(address), "binding to #{address}")
    else
      error_check(socket.connect(address), "connecting to #{address}")
    end
    @logger.info("0mq: #{server? ? 'bound' : 'connected'}", :address => address)
  end

  def error_check(rc, doing, eagain_not_error=false)
    unless ZMQ::Util.resultcode_ok?(rc) || (ZMQ::Util.errno == ZMQ::EAGAIN && eagain_not_error)
      @logger.error("ZeroMQ error while #{doing}", { :error_code => rc })
      raise "ZeroMQ Error while #{doing}"
    end
  end # def error_check

  def setopts(socket, options)
    options.each do |opt,value|
      sockopt = opt.split('::')[1]
      option = ZMQ.const_defined?(sockopt) ? ZMQ.const_get(sockopt) : ZMQ.const_missing(sockopt)
      unless STRING_OPTS.include?(sockopt)
        begin
          Float(value)
          value = value.to_i
        rescue ArgumentError
          raise "#{sockopt} requires a numeric value. #{value} is not numeric"
        end
      end # end unless
      error_check(socket.setsockopt(option, value),
              "while setting #{opt} == #{value}")
    end # end each
  end # end setopts
end # module LogStash::PluginMixins::ZeroMQ
