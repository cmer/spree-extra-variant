class AddExtraVariantToLineItems < ActiveRecord::Migration
  def self.up
    add_column :line_items, :extra_variant, :string
  end

  def self.down
    remove_column :line_items, :extra_variant
  end
end