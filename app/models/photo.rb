class Photo < ActiveRecord::Base

  def self.search(params)
    w = {}
    q = []
    o = {}
    q2 = ""
    q3 = ""
    subjects = ["subject1","subject2","subject3"]
    operators = ["and","or","xor"]
    cols = [ "image_type",
              "provenance",
              "photographer",
              "date_taken",
              "division",
              "subseries",
              "general_sub",
              "specific_sub",
              "publication",
              "notes"
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
