require 'bcrypt'
require 'timeliness/core_ext'

class Route < ApplicationRecord
  
  
  NODES = [ :alpha, :beta, :gamma, :delta, :theta, :lambda, :tau, :psi, :omega ]
  TIME_FORMAT = "yyyy-mm-ddThh:nn:ss"
  
  validates :passphrase_digest, :start_node, :end_node, :source, presence: true
  validates_datetime :start_time_ts, :end_time_ts, format: TIME_FORMAT
  
  enum source: [ :sentinels, :sniffers, :loopholes ]
  enum start_node: NODES, _suffix: true
  enum end_node: NODES, _suffix: true
  
  
  
  
  
  
  
  
  
  def passphrase
    @passphrase ||= BCrypt::Password.new(passphrase_digest)
  end
  
  def passphrase=(new_passphrase)
    @passphrase = BCrypt::Password.create(new_passphrase)
    self.passphrase_digest = @passphrase
  end
  
  ["start_time", "end_time"].each do |method|
    define_method method do
      eval("#{method}_ts.strftime('%Y-%m-%dT%H:%M:%S')")
    end
    
    define_method "#{method}=" do |value|
      eval("self.#{method}_ts = Timeliness.parse('#{value}', format: TIME_FORMAT)")
    end 
  end
  
  
  #def start_time=(new_start_time)
  #  self.start_time_ts = Timeliness.parse(new_start_time, format: TIME_FORMAT)
  #end
  
  #def end_time=(new_end_time)
  #  self.end_time_ts = Timeliness.parse(new_end_time, format: TIME_FORMAT)
  #end
  
  
  
end
