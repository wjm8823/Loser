class Weight < ActiveRecord::Base
  belongs_to :players
  before_destroy :check_week 

  validates :weight, :presence => true
  validates :player_id, :presence => true
  validates_numericality_of :week,:on => :save,:greater_than => Weight.maximum('week', :conditions => ['player_id = ?', player_id])

  private
  def check_week
    self.class.delete_all "week > #{week}"
  end	

end
