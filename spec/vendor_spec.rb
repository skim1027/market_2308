require './lib/vendor'
require './lib/item'

RSpec.describe Vendor do
  before :each do
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  describe '#initialize' do
    it 'initialize' do
      expect(@vendor).to be_instance_of(Vendor)
    end

    it 'has a name' do
      expect(@vendor.name).to eq("Rocky Mountain Fresh")
    end

    it 'has an empty inventory in the beginning' do
      expect(@vendor.inventory).to eq({})
    end
  end

  describe '#check_stock' do
    it 'checks for empty stock' do
      expect(@vendor.check_stock(@item1)).to eq(0)
    end
    
    it 'changes when you stock' do
      @vendor.stock(@item1, 30)
      expect(@vendor.inventory).to eq({@item1 => 30})
      expect(@vendor.check_stock(@item1)).to eq(30)
    end

    it 'adds all the stock' do
      @vendor.stock(@item1, 30)
      @vendor.stock(@item1, 25)
      @vendor.stock(@item2, 12)
      expect(@vendor.inventory).to eq({@item1 => 55, @item2 => 12})
    end
  end

end