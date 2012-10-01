class AddQuoteIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :quote_id, :integer
  end
end
