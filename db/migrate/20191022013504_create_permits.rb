class CreatePermits < ActiveRecord::Migration[5.2]
  def change
    create_table :permits do |t|
      t.string :description

      t.timestamps
    end
  end
end
