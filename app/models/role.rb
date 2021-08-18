class Role < ActiveRecord::Base
    has_many :auditions

    # def actors
    #     auditions.all.map do |actor_role|
    #         actor_role.actor
    #     end
    # end

    def actors
        self.auditions.pluck(:actor)
    end
    
    
    def locations
        self.auditions.pluck(:location)
    end

    def lead
        # self.auditions.find_by(hired: true)
        hiredarray = auditions.where ({ hired: true })
        if hiredarray.length == 0
            "no actor has been hired for this role"
        else
            hiredarray.first
        end
    end

    def understudy 
        hiredarray = auditions.where ({ hired: true })
        if hiredarray.length == 1
            "no actor has been hired for understudy for this role"
        else
            hiredarray.second
        end
    end
end