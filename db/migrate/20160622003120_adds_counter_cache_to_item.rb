class AddsCounterCacheToItem < ActiveRecord::Migration[5.0]
  def up
    add_column :items, :barcode_count, :integer
    Item.all.each { |item|
      Item.reset_counters(item.id, :barcode_items)
    }
  end
  def down
  	remove_column :items, :barcode_count
  end
end
