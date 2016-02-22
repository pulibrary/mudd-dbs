class Faculty < ActiveRecord::Base

  def self.search(params)
    q = Array.new
    cols = [ "access_id","lname","fname","birth","birth_year","death","leave","dept","box","series" ]

    params.except(:action, :controller).each do |k, v|
      if cols.include? k.downcase
        #sanitize inputs to prevent sql injection
				v.gsub!(/[";'']/, '"' => '', ';' => '', '\'' => '\\\'')
        q << "#{k} LIKE '%#{v}%'"
      end
    end

      where(q.join(" AND ")).order(:lname)

  end

end
