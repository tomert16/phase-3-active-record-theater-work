class Role < ActiveRecord::Base
    has_many :auditions

    def actors
      self.auditions.map{ |a| a[:actor]}
    end

    def locations 
        self.auditions.map { |a| a[:location] }
    end

    def lead
        self.auditions.find_by(hired: true) || "no actor has been hired for this role"
        # or self.auditions.where(hired: true).first || "no actor has been hired for this role"
    end
    def understudy
        self.auditions.where(hired: true).second || "no actor has been hired for understudy for this role"
    end
end