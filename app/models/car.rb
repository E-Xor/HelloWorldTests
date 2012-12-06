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
    puts "Stopping"
  end
  
  def starting
    puts "Starting"
  end

end
