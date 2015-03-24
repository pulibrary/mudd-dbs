class WwiiMemorial < ActiveRecord::Base

  def self.search(params)
    q = Array.new
    cols = [ "rank","name","death_date","place","year" ]

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
