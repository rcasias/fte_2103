class FoodTruck
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def add_item(item, start_at_0)
    @inventory[item] = 0
  end

  def check_stock(item)
      @inventory[item]
  end

  def stock(item, amount)
    @inventory[item] = (@inventory[item] + amount)
    @inventory
  end

  def check_stock(item)
    @inventory[item]
  end

  def potential_revenue
    total = 0
    @inventory.each do |key, value|
      amount = key.price.to_s.tr('$', '').to_f
      total += (amount * value)
      # require'pry';binding.pry
    end
    total
  end

end
