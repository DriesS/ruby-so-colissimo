module SoColissimo
  
  class Client
  
    def self.execute(action, body, order)
      body[:order!] = order.unshift(:accountNumber, :password)
      response = client.request :poin, action do
        soap.body = body.merge(login)
      end
      response_return = response.to_hash[:"#{action.underscore.to_sym}_#{"response"}"][:return]
      raise SoColissimo::Error.new(response_return[:error_code], response_return[:error_message]) if response_return[:error_code] != "0"
      return response_return
    end
  
    protected
  
    def self.client
      @@client ||= Savon::Client.new do
        wsdl.namespace = "http://pointretrait.geopost.com/"
        wsdl.endpoint = "http://ws.colissimo.fr/pointretrait-ws-cxf/PointRetraitServiceWS"
        wsdl.element_form_default = :unqualified
      end
    end
  
    def self.login
      {:accountNumber => SoColissimo.config[:username], :password => SoColissimo.config[:password]}
    end
   
  end

end