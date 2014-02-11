class AddPaperclipToPosters < ActiveRecord::Migration
  def self.up
    add_attachment :posters, :attachment
  end
  def self.down
    remove_attachment :posters, :attachment
  end
end
