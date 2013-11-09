class AddAttachmentPictureToSteps < ActiveRecord::Migration
  def self.up
    change_table :steps do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :steps, :picture
  end
end
