class Graduate < ActiveRecord::Base

	def self.search(params)
	  q = Array.new
	  cols = [ "box","lastname","firstname","year","department","deathdate","photos","oversize" ] 

	  params.except(:action, :controller).each do |k, v|
	  	if cols.include? k.downcase
	  		q << "#{k} LIKE '%#{v}%'"
	  	end
	  end

  	  where(q.join(" AND "))
 
	end

end
