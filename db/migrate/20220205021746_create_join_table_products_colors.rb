class CreateJoinTableProductsColors < ActiveRecord::Migration[6.1]
  def change
    create_join_table :products, :colors
  end
end
