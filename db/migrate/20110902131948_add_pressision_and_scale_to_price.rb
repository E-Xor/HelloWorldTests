class AddPressisionAndScaleToPrice < ActiveRecord::Migration
  def self.up
    change_table :my_test_scaffolds do |t|
      t.change :price, :decimal, :precision => 8, :scale => 2
    end
  end

  def self.down
    change_table :my_test_scaffolds do |t|
      t.change :price, :decimal
    end

  end
end
