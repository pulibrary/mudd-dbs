class Faculty < ActiveRecord::Base

  def self.search(params)
    q = Array.new
    cols = [ "access_id","lname","fname","birth","birth year","death","leave","dept","box","series" ]

    params.except(:action, :controller).each do |k, v|
      if cols.include? k.downcase
        q << "#{k} LIKE '%#{v}%'"
      end
    end

      where(q.join(" AND "))

  end

end
