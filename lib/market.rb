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
end