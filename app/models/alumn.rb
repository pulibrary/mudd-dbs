class Alumn < ActiveRecord::Base
	# represents alumns from 1748-1920... perhaps combine with new_alumn someday

	def self.search(params)
	  q = Array.new
	  cols = [ "box","lname","fname","year","graduate","photos","oversize" ]

	  params.except(:action, :controller).each do |k, v|
	  	if cols.include? k.downcase
				#sanitize inputs to prevent sql injection
				v.gsub!(/[";'']/, '"' => '', ';' => '', '\'' => '\\\'')
	  		q << "#{k} LIKE '%#{v}%'"
	  	end
	  end

  	  where(q.join(" AND "))

	end

end
