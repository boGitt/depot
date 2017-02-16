class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def total_price
    product.price * quantity
  end

  def minus_one_product(line_item_id)
    current_item = LineItem.find(line_item_id)
    current_item.update_attribute('quantity', current_item.quantity -= 1)

    if current_item.quantity == 0
      current_item.destroy
    end

    true
  end

end
