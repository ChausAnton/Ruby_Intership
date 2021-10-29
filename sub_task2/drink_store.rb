class ShopInventory

    def initialize(inventory)
        @inventory = inventory
    end
    
    def item_in_stock
        drinks_names_in_stock = @inventory.map{|elem| elem[:quantity_by_size].empty?() ? "" : elem[:name]}
        drinks_names_in_stock.delete("")
        drinks_names_in_stock.sort
    end

    def affordable
        drinks_affordable = @inventory.map{|elem| elem[:price] < 50 ? elem : ""}
        drinks_affordable.delete("")
        drinks_affordable
    end

    def out_of_stock
        drinks_out_of_stock = @inventory.map{|elem| elem[:quantity_by_size].empty?() ? elem : ""}
        drinks_out_of_stock.delete("")
        drinks_out_of_stock
    end

    def how_much_left(name)
        drinks_how_much_left = @inventory.map{|elem| elem[:name] == name ? elem : ""}
        drinks_how_much_left.delete("")
        drinks_how_much_left[0][:quantity_by_size]
    end

    def total_stock()
        drinks_total_stock = @inventory.map{|elem| elem[:quantity_by_size].empty?() ? "" : elem[:quantity_by_size]}
        drinks_total_stock.delete("")
        (drinks_total_stock.map{|elem|
            sum = 0
            elem.each do |key, value|
                sum += value
            end
            sum
        }).sum
    end
end

inventory = [
    {price: 125.00, name: "Cola", quantity_by_size: {l033: 3, l05: 7, l1: 8, l2: 4}},
    {price: 40.00, name: "Pepsi", quantity_by_size: {}},
    {price: 39.99, name: "Water", quantity_by_size: {l033: 1, l2: 4}},
    {price: 70.00, name: "Juice", quantity_by_size: {l033: 7, l05: 2}}
    ]

obj = ShopInventory.new(inventory)
puts "item_in_stock:"
puts "#{obj.item_in_stock}\n\n"
puts "affordable:"
puts "#{obj.affordable}\n\n"
puts "out_of_stock:"
puts "#{obj.out_of_stock}\n\n"
puts "how_much_left:"
puts "#{obj.how_much_left("Cola")}\n\n"
puts "total_stock:"
puts "#{obj.total_stock()}\n\n"
