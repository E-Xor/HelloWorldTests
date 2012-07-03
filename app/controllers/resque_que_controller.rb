class ResqueQueController < ApplicationController
  def index
    Resque.enqueue(BgPrint, Time.now)
    @printed = ResqueQue.all
  end
end
