class WwiiMemorial < ActiveRecord::Base

  def self.search(params)
    q = Array.new
    cols = [ "rank","name","death_year","place","year" ]

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
