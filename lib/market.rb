class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendors_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    vendors_sell = []
    @vendors.each do |vendor|
      vendor.inventory.each do |inventory|
        if inventory.first == item
          vendors_sell << vendor 
        end
      end
    end
    vendors_sell
  end

  def sorted_item_list
    vendors_items = []
    @vendors.each do |vendor|
      vendor.inventory.each do |inventory|
        vendors_items << inventory.first.name
      end
    end
    vendors_items.uniq.sort
  end

  def total_inventory
    total_inventory = Hash.new{ |h, k| h[k] = {} }
    key = @vendors.map do |vendor|
      vendor.inventory
    end

    values = {}
    @vendors.map do |vendor|
      vendor.inventory.each do |item|
        values.store(:quantity, item[1])
      end
      values.store(:vendors, vendor)
    end

    total_inventory[key] = values
  end

  def overstocked_item
    overstocked = []
    @vendors.each do |vendor|
      vendor.inventory.each do |item|
        if item[1] > 50
          overstocked << item
        end
      end
    end
    overstocked.flatten
  end
end