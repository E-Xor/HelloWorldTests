class Car < ActiveRecord::Base

  validates :name, :presence => true

  state_machine :state, :initial => :stopped do 
    state :started
    state :stopped
    
    before_transition any => :stopped, :do => :stopping
    after_transition any => :started, :do => :starting
    
    event :stop_it do
      transition :started => :stopped
    end
    
    event :start_it do
      transition :stopped => :started
    end

  end
  
  def stopping
    Rails.logger.debug "Stopping"
  end
  
  def starting
    Rails.logger.debug "Starting"
  end

end
