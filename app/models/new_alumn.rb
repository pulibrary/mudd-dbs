class NewAlumn < ActiveRecord::Base
	#represents Alumni from 1921 to last load
	include Globals

	def self.search(params)
	  q = Array.new
	  cols = [ "lname","fname","year","pubfile","academicfile" ] 

	  params.except(:action, :controller).each do |k, v|
	  	if cols.include? k.downcase
	  		q << "#{k} LIKE '%#{v}%'"
	  	end
	  end

  	  where(q.join(" AND "))
 
	end

end