class AddPublicUrlToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :public_url, :string
    add_column :products, :public_url, :string
  end
end
