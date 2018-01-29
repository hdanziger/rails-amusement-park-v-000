class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :attraction
  belongs_to :user
  
  def take_ride
      enough_tickets, tall_enough = meet_qualifications
    if enough_tickets && tall_enough
        update_info
      elsif 
      tall_enough && !enough_tickets
          "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
      elsif 
       enough_tickets && !tall_enough
          "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        else
          "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
      end
  end
  
  def meet_qualifications
      enough_tickets, tall_enough = false
      if self.user.tickets >= self.attraction.tickets
        enough_tickets = true
    end
    if self.user.height >= self.attraction.min_height
        tall_enough = true 
    end
    return [enough_tickets, tall_enough]
end

    def update_info
        updated_tickets = self.user.tickets - self.attraction.tickets
        updated_happiness = self.user.happiness + self.attraction.happiness_rating
        updated_nausea = self.user.nausea + self.attraction.nausea_rating
        
        self.user.update(:happiness => updated_happiness, :tickets => updated_tickets, :nausea => updated_nausea)
        
        "Thanks for riding the #{self.attraction.name}!"
    end
        
      
end
