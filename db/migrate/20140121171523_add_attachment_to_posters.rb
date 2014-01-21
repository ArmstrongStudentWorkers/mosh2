class AddAttachmentToPosters < ActiveRecord::Migration
  def change
    add_column :posters, :attachment_file_name, :string
    add_column :posters, :attachment_file_size, :integer
  end
end
