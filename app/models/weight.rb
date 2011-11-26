class Weight < ActiveRecord::Base
  belongs_to :player
  before_destroy :check_week 
  before_save :add_loss

  validates :weight, :presence => true
  validates :player_id, :presence => true
  validates :week, :presence => true 
  validates_uniqueness_of :week,:scope => [:player_id]

  private
  def check_week
    self.class.delete_all "week > #{week} and player_id = #{player_id}"
  end	
 
  def add_loss
    if self.week > 1
	@first_week = Weight.find_by_player_id_and_week(self.player_id,1)
	@last_week = Weight.find_by_player_id_and_week(self.player_id,(self.week-1))
        self.week_loss = @last_week.weight - self.weight
	self.week_percent = (self.week_loss.to_f / @last_week.weight.to_f)*100
	self.total_loss = @first_week.weight - self.weight
        self.total_percent = (self.total_loss.to_f / @first_week.weight.to_f) * 100
    end
  end

end
