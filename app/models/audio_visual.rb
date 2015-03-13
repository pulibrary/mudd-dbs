class AudioVisual < ActiveRecord::Base

# qname=AV&ID2=&ID=Film&DATE=1975&keyword1=&operator1=AND&keyword2=&operator2=AND&keyword3=

	def self.search(params)
	  w = {}
	  q = []
	  o = {}
	  q2 = ""
	  q3 = ""
	  subjects = ["keyword1","keyword2","keyword3"]
	  operators = ["and","or","xor"]
	  cols = [ "title",
	  		   "creator",
	  		   "notes"
	  		  ]

	  params.except(:action, :controller).each do |k, v|
	  	if subjects.include? k.downcase
	  		if !v.empty?
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

	  if !w["keyword2"].blank?
	  	q2 = " " + o["operator1"] + " " + w["subject2"]
	  end

	  if !w["keyword3"].blank?
	  	q3 = " " + o["operator2"] + " " + w["subject3"]
	  end

	  query = w["keyword1"] + q2 + q3

	  where(query)
 
	end

end
