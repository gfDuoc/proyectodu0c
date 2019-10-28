class AddNoteToDocument < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :note, :string
    add_column :documents, :tag, :string
  end
end
