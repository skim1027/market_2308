class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(check_item)
    if @inventory.empty?
      0
    else
      @inventory.find do |item, quantity|
        if item == check_item
          return quantity
        end
      end
    end
  end

  def stock(item, quantity)
    key = @inventory[item]
    value = quantity
    key = quantity

  end
end