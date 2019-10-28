class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :name
      t.string :typo
      t.datetime :date
      t.string :author
      t.string :company

      t.timestamps
    end
  end
end
