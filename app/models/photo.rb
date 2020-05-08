class Photo < ActiveRecord::Base

  def self.search(params)
    w = {}
    w["subject1"] = "1 = 1"
    q = []
    o = {}
    q2 = ""
    q3 = ""
    q4 = ""
    q5 = ""
    q6 = ""
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

    if !w["subject2"].blank?
      q2 = " " + o["operator1"] + " " + w["subject2"]
    end

    if !w["subject3"].blank?
      q3 = " " + o["operator2"] + " " + w["subject3"]
    end

    if !params[:division].blank?
      v = params[:division]
      v.gsub!(/[";'']/, '"' => '', ';' => '', '\'' => '\\\'')
      q4 = " AND division ILIKE '%#{v}%'"
    end

    if !params[:photographer].blank?
      v = params[:photographer]
      v.gsub!(/[";'']/, '"' => '', ';' => '', '\'' => '\\\'')
      q5 = " AND photographer ILIKE '%#{v}%'"
    end

    if !params[:image_type].blank?
      v = params[:image_type]
      v.gsub!(/[";'']/, '"' => '', ';' => '', '\'' => '\\\'')
      q6 = " AND image_type ILIKE '%#{v}%'"
    end

    query = w["subject1"] + q2 + q3 + q4 + q5 + q6

    where(query)

  end

end
