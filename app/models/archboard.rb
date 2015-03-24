class Archboard < ActiveRecord::Base

	def self.search(params)
	  w = {}
	  q = []
	  o = {}
	  q2 = ""
	  q3 = ""
	  subjects = ["subject1","subject2","subject3"]
	  operators = ["and","or","xor"]
	  cols = [ "building_info_sheet",
	  		   "drawing_title",
	  		   "drawing_number",
	  		   "project_type",
	  		   "drawing_type",
	  		   "board_date",
	  		   "board_dimensions",
	  		   "color",
	  		   "drawing_view",
	  		   "elevation",
	  		   "comments",
	  		   "contractor1_type",
	  		   "contractor1_name",
	  		   "contractor2_type",
	  		   "contractor2_name",
	  		   "contractor3_type",
	  		   "contractor3_name"
	  		  ]

	  params.except(:action, :controller).each do |k, v|
	  	if subjects.include? k.downcase
	  		if !v.empty?
					#sanitize inputs to prevent sql injection
					v.gsub!(/[";'']/, '"' => '', ';' => '', '\'' => '\\\'')
	  			cols.each do |x|
	  				q << "#{x} LIKE '%#{v}%'"
	  			end
	  			w[k] = "(" + q.join(" OR ") + ")"
	  			q = []
	  		end
	  	end
	  	if operators.include? v.downcase
	  			o[k] = v.downcase
	  	end
	  end

	  if !w["subject2"].blank?
	  	q2 = " " + o["operator1"] + " " + w["subject2"]
	  end

	  if !w["subject3"].blank?
	  	q3 = " " + o["operator2"] + " " + w["subject3"]
	  end

	  query = w["subject1"] + q2 + q3

	  where(query)

	end

end
