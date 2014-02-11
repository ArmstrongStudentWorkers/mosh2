class RemoveAttachmentFromPosters < ActiveRecord::Migration
  def up
    remove_column :posters, :attachment_file_name
    remove_column :posters, :attachment_file_size
  end

  def down
    add_column :posters, :attachment_file_size, :integer
    add_column :posters, :attachment_file_name, :string
  end
end
