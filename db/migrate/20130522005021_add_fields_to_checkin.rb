class AddFieldsToCheckin < ActiveRecord::Migration
  def change
    add_column :check_ins, :venue, :text
    remove_column :check_ins, :location
  end
end
