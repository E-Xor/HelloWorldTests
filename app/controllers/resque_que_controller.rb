class ResqueQueController < ApplicationController
  def index
    #Resque.enqueue(BgPrint, Time.now)
    Resque.enqueue_at(1.minute.from_now, BgPrint, Time.now)
    # Do not foreget to run `rake resque:work QUEUE='*'`
    # and `rake resque:scheduler`
    @printed = ResqueQue.all
  end
end
