module SoColissimo
	
	class Point
		class << self # Class methods

			def search(params = {}, order = [])
				result = SoColissimo::Client.execute("findPointRetrait", params, order)
				if result[:liste_point_retrait]
					points = result[:liste_point_retrait].map do |r| 
    				OpenStruct.new(r)
    			end
    		end
    		return points
 			end

 			def search_by_id(params = {}, order = [])
 				result = SoColissimo::Client.execute("findPointRetraitByID", params, order)
				point = OpenStruct.new(result[:point_retrait])
    		return point
 			end
		
		end
	end
end