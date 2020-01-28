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
      all_items[index] = cart[index]
    end
    index += 1
  end
all_items
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
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
