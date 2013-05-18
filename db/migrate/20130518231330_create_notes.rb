class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :text,      :null => false

      t.references :trip,  :null => false
      t.references :user,  :null => false

      t.timestamps
    end
  end
end
