class NassauLiterature < ActiveRecord::Base

  def self.search(params)
    q = Array.new
    cols = [ "lname","fname","classyear","title" ]

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
