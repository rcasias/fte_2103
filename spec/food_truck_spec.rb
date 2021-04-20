require "./lib/item"
require "./lib/food_truck"

RSpec.describe 'FoodTruck' do
  it 'exists' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck).to be_instance_of(FoodTruck)
  end

  context "initialize works" do
    it 'has attributes' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      expect(food_truck.name).to eq("Rocky Mountain Pies")
      expect(food_truck.inventory).to eq({})
    end

    it 'can add an item to truck' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      food_truck.add_item(item1, 0)
      food_truck.add_item(item2, 0)

      expect(food_truck.inventory.length).to eq(2)
    end

    it 'can check stock' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      food_truck.add_item(item1, 0)
      food_truck.add_item(item2, 0)

      expect(food_truck.check_stock(item1)).to eq(0)
    end

    it 'can add to stock' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      food_truck.add_item(item1, 0)

      result = {item1 => 30}

      expect(food_truck.stock(item1, 30)).to eq(result)
    end

    it 'can check stock' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      food_truck.add_item(item1, 0)
      food_truck.add_item(item2, 0)
      food_truck.stock(item1, 30)
      food_truck.stock(item1, 25)
      food_truck.stock(item2, 12)

      expect(food_truck.check_stock(item1)).to eq(55)
    end

    it 'can check stock' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      food_truck.add_item(item1, 0)
      food_truck.add_item(item2, 0)
      food_truck.stock(item1, 30)
      food_truck.stock(item1, 25)
      food_truck.stock(item2, 12)

      result = {item1 => 55,
                item2 => 12}

      expect(food_truck.inventory).to eq(result)
    end
  end
end
