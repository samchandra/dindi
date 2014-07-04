module DebugOn

  def app_debug_on
    settings.app_logger.info("===== START =====> #{Time.now.strftime("%d/%m/%Y %H:%M %p")}")
    settings.app_logger.info(request.url)
    settings.app_logger.info("Params:")
    params.each do |key, value|
      settings.app_logger.info("#{key} => #{value}")
    end
  end
  
  def app_logger(text)
    settings.app_logger.info(text)
  end
  
  # Basic Authentication
  def protected!
    unless authorized?
      response['WWW-Authenticate'] = %(Basic realm="Restricted Area")
      throw(:halt, [401, "Not authorized\n"])
    end 
  end 

  def authorized?
    @auth ||= Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == ['admin', 'password']
  end  

end
