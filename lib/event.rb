class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    trucks = []
    @food_trucks.each do |truck|
      if truck.inventory.include?(item)
        trucks << truck.name
      end
    end
    trucks
  end

  def list_trucks
    trucks = []
    @food_trucks.each do |truck|
      truck.inventory
    end
    truck.uniq
  end

  def total_inventory
    require'pry';binding.pry
    item_hash = list_trucks.each_with_object({}) do |truck, hash|
      hash[truck.inventory] = {}
    end
    item_hash
  end
end
