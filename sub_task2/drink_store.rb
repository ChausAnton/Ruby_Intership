class ShopInventory
    @@DrinksNames = []

    def initialize(inventory)
        @@inventory = inventory
    end
    
    def item_in_stock
        @@DrinksNames = @@inventory.map{|elem| elem[:quantity_by_size].empty?() ? "" : elem[:name]}
        @@DrinksNames.delete("")
        @@DrinksNames.sort
    end
end

inventory = [
    {price: 125.00, name: "Cola", quantity_by_size: {l033: 3, l05: 7, l1: 8, l2: 4}},
    {price: 40.00, name: "Pepsi", quantity_by_size: {}},
    {price: 39.99, name: "Water", quantity_by_size: {l033: 1, l2: 4}},
    {price: 70.00, name: "Juice", quantity_by_size: {l033: 7, l05: 2}}
    ]

obj = ShopInventory.new(inventory)
puts obj.item_in_stock