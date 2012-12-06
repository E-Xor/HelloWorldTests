class Car < ActiveRecord::Base

  state_machine :state, :initial => :stop do 
    state :start
    state :stop
    
    before_transition any => :stop, :do => :stopping
    after_transition any => :start, :do => :starting
    
    event :stop_it do
      transition :start => :stop
    end
    
    event :start_it do
      transition :stop => :start
    end

  end
  
  def stopping
    puts "Stopping"
  end
  
  def starting
    puts "Starting"
  end
  
  def initialize
    super()
  end
end
