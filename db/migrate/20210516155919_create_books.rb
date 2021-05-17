class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author_name
      t.string :publish_year, limit: 4
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
