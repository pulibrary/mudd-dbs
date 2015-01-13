class Alumn < ActiveRecord::Base

	def self.search(params)
	  q = Array.new
	  vals = Array.new

	  params.except(:action, :controller).each do |k, v|
	  	q << "#{k} LIKE '%#{v}%'"
	  end

  	  find(:all, :conditions => q.join(" AND "))
 
	end

end
