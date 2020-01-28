def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  index = 0
  isFound = nil
  while index < collection.length do
    if collection[index][:item] == name
      isFound = collection[index]
    end
    index += 1
  end
  isFound
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  all_items = [] # unique array
  index = 0

  while index < cart.count do
    item = cart[index][:item]
    item_to_find = find_item_by_name_in_collection(item, all_items)
    if item_to_find
      item_to_find[:count] += 1
    else
      cart[index][:count] = 1
      all_items << cart[index]
    end
    index += 1
  end
all_items
end

def coupon_hash(coupon)
  unit_price = (coupon[:cost] * 1.0 / coupon[:num]).round(2)
  {
    :item => "#{coupon[:item]} W/COUPON",
    :price => unit_price,
    :count => coupon[:num]
  }
end
def apply_coupon_to_cart(item, coupon, cart)
  item[:count] -= coupon[:num]
  updated_item = coupon_hash(coupon)
  updated_item[:clearance] = item[:clearance]
  cart << updated_item
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  index = 0
  while index < coupons.length do
    coupon = coupon[index]
    discount_item =  find_item_by_name_in_collection(coupon[:item], cart)
    in_basket = !!discount_item
    can_apply = in_basket && discount_item[:count] >= coupon[:num]
    
    if discount_item && can_apply
      apply_coupon_to_cart(discount_item, coupon, cart)
    end
    index += 1
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
