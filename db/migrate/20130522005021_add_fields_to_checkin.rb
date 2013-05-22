class AddFieldsToCheckin < ActiveRecord::Migration
  def change
    add_column :check_ins, :venue, :string
    add_column :check_ins, :short_url, :string
  end
end
