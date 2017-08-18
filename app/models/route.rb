require 'bcrypt'
require 'timeliness/core_ext'

class Route < ApplicationRecord
  
  NODES = [ :alpha, :beta, :gamma, :delta, :theta, :lambda, :tau, :psi, :omega ]
  TIME_FORMAT = "yyyy-mm-ddThh:nn:ssZ"
  
  validates :passphrase_digest, presence: true
  validates_datetime :start_time, :end_time, format: TIME_FORMAT
  
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
      Timeliness.parse(eval("#{method}_ts"), :format => TIME_FORMAT)
    end
  end
  
  
  def start_time=(new_start_time)
    self.start_time_ts = Time.iso8601(new_start_time)
  end
  
  def end_time=(new_end_time)
    self.end_time_ts = Time.iso8601(new_end_time)
  end
  
  
  
end
