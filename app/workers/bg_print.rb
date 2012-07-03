class BgPrint
  @queue = :bgs

  def self.perform(attr)
    ResqueQue.create(:printed => "#{attr} was printed in background. Worker.")
  end
end
