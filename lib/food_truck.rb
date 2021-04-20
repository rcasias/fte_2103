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
    # require'pry';binding.pry
  end

end
