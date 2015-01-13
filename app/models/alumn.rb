class Alumn < ActiveRecord::Base

	def self.search(params)
	  q = Array.new
	  cols = [ "box","lname","fname","year","graduate","photos","oversize" ] 

	  params.except(:action, :controller).each do |k, v|
	  	if cols.include? k.downcase
	  		q << "#{k} LIKE '%#{v}%'"
	  	end
	  end

  	  find(:all, :conditions => q.join(" AND "))
 
	end

end
