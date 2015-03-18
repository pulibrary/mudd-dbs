class Memorabilium < ActiveRecord::Base

  def self.search(params)
    q = Array.new
    cols = [ "box","category","description","classyear","year","reunion","provenance" ]
    
    params.except(:action, :controller).each do |k, v|
      if cols.include? k.downcase
        q << "#{k} LIKE '%#{v}%'"
      end
    end

      where(q.join(" AND "))

  end

end