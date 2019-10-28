class CreatePersonas < ActiveRecord::Migration[5.2]
  def change
    create_table :personas do |t|
      t.string :name
      t.string :lastname
      t.string :address
      t.string :phone
      t.date :birthday

      t.timestamps
    end
  end
end
