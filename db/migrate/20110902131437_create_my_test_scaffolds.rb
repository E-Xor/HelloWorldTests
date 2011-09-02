class CreateMyTestScaffolds < ActiveRecord::Migration
  def self.up
    create_table :my_test_scaffolds do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price

      t.timestamps
    end
  end

  def self.down
    drop_table :my_test_scaffolds
  end
end
