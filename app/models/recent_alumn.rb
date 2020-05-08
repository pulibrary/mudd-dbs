class RecentAlumn < ActiveRecord::Base
	#represents Alumni from 1921 to last load
	include Globals

	def self.search(params)
	  q = Array.new
	  cols = [ "lname","fname","year","pubfile","academicfile" ]

	  params.except(:action, :controller).each do |k, v|
	  	if cols.include? k.downcase
				#sanitize inputs to prevent sql injection
				v.gsub!(/[";'']/, '"' => '', ';' => '', '\'' => '\\\'')
	  		q << "#{k} ILIKE '%#{v}%'"
	  	end
	  end

  	  where(q.join(" AND "))

	end

end
