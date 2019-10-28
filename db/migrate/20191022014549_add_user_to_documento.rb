class AddUserToDocumento < ActiveRecord::Migration[5.2]
  def change
    add_reference :documents, :user, foreign_key: true
    add_column :documents, :status, :string
  end
end
