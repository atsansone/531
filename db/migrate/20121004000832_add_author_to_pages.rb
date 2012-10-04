class AddAuthorToPages < ActiveRecord::Migration
  def change
    add_column :pages, :author, :string, default: "Site Staff"
  end
end
