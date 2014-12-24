class CreateFlies < ActiveRecord::Migration
  def change
    create_table :flies do |t|
      t.string :name
      t.string :position
      t.string :expiration
      t.string :website
      t.string :equipment
      t.string :base
      t.text :intro
      t.text :content
      t.hstore :requirements
      t.string :slug
      t.index :slug
      t.belongs_to :airline

      t.timestamps null: false
    end
  end
end
