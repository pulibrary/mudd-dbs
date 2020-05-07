class AudioVisual < ActiveRecord::Base

	def self.search(params)
	  w = {}
	  w["keyword1"] = "1 = 1"
	  q = []
	  o = {}
	  q2 = ""
	  q3 = ""
	  q4 = ""
      q5 = ""
      q6 = ""
	  subjects = ["keyword1","keyword2","keyword3"]
	  operators = ["and","or","xor"]
	  cols = [ "title",
	  		   "creator",
	  		   "notes"
	  		  ]

	  params.except(:action, :controller).each do |k, v|
	  	if subjects.include? k.downcase
	  		if !v.empty?
				#sanitize inputs to prevent sql injection
				v.gsub!(/[";'']/, '"' => '', ';' => '', '\'' => '\\\'')
	  			
	  			cols.each do |x|
	  				q << "#{x} ILIKE '%#{v}%'"
	  			end
	  			
	  			w[k] = "(" + q.join(" OR ") + ")"
	  			q = []
	  		end
	  	end
	  	if operators.include? v.downcase
	  			o[k] = v.downcase
	  	end
	  end

	  if !w["keyword2"].blank?
	  	q2 = " " + o["operator1"] + " " + w["keyword2"]
	  end

	  if !w["keyword3"].blank?
	  	q3 = " " + o["operator2"] + " " + w["keyword3"]
	  end

    if !params[:topic].blank?
      v = params[:topic]
      v.gsub!(/[";'']/, '"' => '', ';' => '', '\'' => '\\\'')
      q4 = " AND topic ILIKE '%#{v}%'"
    end

    if !params[:format].blank?
      v = params[:format]
      v.gsub!(/[";'']/, '"' => '', ';' => '', '\'' => '\\\'')
      q5 = " AND format ILIKE '%#{v}%'"
    end

    if !params[:year].blank?
      v = params[:year]
      v.gsub!(/[";'']/, '"' => '', ';' => '', '\'' => '\\\'')
      q6 = " AND year ILIKE '%#{v}%'"
    end

	  query = w["keyword1"] + q2 + q3 + q4 + q5 + q6

	  where(query).order(:box,:item)

	end

end
