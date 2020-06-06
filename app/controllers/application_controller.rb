class ApplicationController < ActionController::API
  def root
    @current_time = Time.current
    # @uptime = IO.read('/proc/uptime').split[0].to_f
    render 'root.json'
  end
end
