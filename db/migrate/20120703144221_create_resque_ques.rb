class CreateResqueQues < ActiveRecord::Migration
  def self.up
    create_table :resque_ques do |t|
      t.string :printed

      t.timestamps
    end
  end

  def self.down
    drop_table :resque_ques
  end
end
