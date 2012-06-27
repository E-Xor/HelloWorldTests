class AddAttachmentImageToMyTestScaffolds < ActiveRecord::Migration
  def self.up
    change_table :my_test_scaffolds do |t|
      t.has_attached_file :image
    end
  end

  def self.down
    drop_attached_file :my_test_scaffolds, :image
  end
end
