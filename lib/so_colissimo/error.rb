module SoColissimo
	class Error < StandardError
		
		def initialize error_code, message
		  super error_code + ": " + message
		end
	end

end

