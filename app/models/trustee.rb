class Trustee < ActiveRecord::Base

  def self.search(params)
    q = Array.new
    cols = [ "full_name","trustee_type" ]

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
