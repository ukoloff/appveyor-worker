require 'json'
require 'net/http'

require_relative "worker/version"

module AppVeyor::Worker
  def self.skip?
    !api
  end

  def self.message msg, details=nil
    x = api or return
    body = JSON.generate category: 'info',
      message: msg,
      details: details
    x.post '/api/build/messages',
      body,
      'Content-Length'=>body.length.to_s,
      'Content-Type'=>'application/json'
  end

  def self.test info
    x = api or return
    body = JSON.generate info
    x.post '/api/tests',
      body,
      'Content-Length'=>body.length.to_s,
      'Content-Type'=>'application/json'
  end

  def self.env envs
    x = api or return
    envs.each do |k, v|
      body = JSON.generate name: k, value: v
      x.post '/api/build/variables',
        body,
        'Content-Length'=>body.length.to_s,
        'Content-Type'=>'application/json'
    end
  end

  private

  def self.api
    return if false===@http
    return @http if @http
    unless z = ENV['APPVEYOR_API_URL']
      @http = false
      return
    end
    z = URI z
    @http = x = Net::HTTP.start z.host, z.port
    x.use_ssl='https'==z.scheme
    x
  end

end
