require "./lib/item"
require "./lib/food_truck"
require "./lib/event"

RSpec.describe 'Event' do
  it 'exists' do
    event = Event.new("South Pearl Street Farmers Market")

    expect(event).to be_instance_of(Event)
  end

  context "initialize works" do
    it 'has attributes' do
      event = Event.new("South Pearl Street Farmers Market")

      expect(event.name).to eq("South Pearl Street Farmers Market")
      expect(event.food_trucks).to eq([])
    end
  end

  context "methods" do
    it 'can add truck' do
      event = Event.new("South Pearl Street Farmers Market")

      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
      food_truck3 = FoodTruck.new("Palisade Peach Shack")
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      expect(event.food_trucks).to eq([food_truck1, food_truck2, food_truck3])
    end

    it 'can lsit the names of food trucks' do
      event = Event.new("South Pearl Street Farmers Market")

      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
      food_truck3 = FoodTruck.new("Palisade Peach Shack")
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      expect(event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end

    it 'can list the truck that sell certain type of food' do
      event = Event.new("South Pearl Street Farmers Market")

      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
      food_truck3 = FoodTruck.new("Palisade Peach Shack")
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

      food_truck1.add_item(item1, 0)
      food_truck1.add_item(item2, 0)
      food_truck2.add_item(item4, 0)
      food_truck2.add_item(item3, 0)
      food_truck3.add_item(item1, 0)

      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)

      expect(event.food_trucks_that_sell(item1)).to eq(["Rocky Mountain Pies", "Palisade Peach Shack"])
    end

    it 'can list the truck that sell certain type of food' do
      event = Event.new("South Pearl Street Farmers Market")

      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
      food_truck3 = FoodTruck.new("Palisade Peach Shack")
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

      food_truck1.add_item(item1, 0)
      food_truck1.add_item(item2, 0)

      food_truck2.add_item(item4, 0)
      food_truck2.add_item(item3, 0)

      food_truck3.add_item(item1, 0)
      food_truck3.add_item(item3, 0)

      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)

      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)

      food_truck3.stock(item1, 65)
      food_truck3.stock(item3, 10)

      # result = {
      #   item1 => {quantity: 100, food_trucks: [food_truck1, food_truck3]},
      #   item2 => {quantity: 7, food_trucks: [food_truck1]},
      #   item3 => {quantity: 50, food_trucks: [food_truck2]},
      #   item4 => {quantity: 35, food_trucks: [food_truck2]},
      # }

      expect(event.total_inventory).to eq(reslut)
    end
  end
end
