class AddColumnParentCategoryIdToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :parent_category_id, :integer
  end
end
