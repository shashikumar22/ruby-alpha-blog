class AddDecriptionToTables < ActiveRecord::Migration[5.1]
  def change
  	add_column :articles, :description, :text
  	# add_column :articles, :created_at, :datetime_
  	# add_column :articles, :updated_at, :datetime_
  end
end
