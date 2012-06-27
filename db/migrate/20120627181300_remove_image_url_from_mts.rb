class RemoveImageUrlFromMts < ActiveRecord::Migration
  def self.up
    remove_column :my_test_scaffolds, :image_url
  end

  def self.down
    add_column :my_test_scaffolds, :image_url, :string

  end
end
