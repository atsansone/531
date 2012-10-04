class AddAuthorToPages < ActiveRecord::Migration
  def change
    add_column :pages, :author, :string
  end
end
