require 'pry'

class CashRegister

    attr_accessor :total, :discount, :items, :last_item

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_item = ""
    end

    def add_item (title, price, quantity = 1)
        self.total += (price * quantity)
        quantity.times {self.items << title}
        self.last_item = {last_item: self.items.last(), last_item_price: price}
    end

    def apply_discount
        if self.discount <= 0 then "There is no discount to apply."
        else
            self.total = self.total - (self.total * self.discount / 100)
            "After the discount, the total comes to $#{self.total}."
        end
    end

    def void_last_transaction
        #subtracts the last item from the total
        self.items.pop()
        if self.items.length == 0
            self.total = 0.0
        else
            self.total = self.total - self.last_item[:last_item_price]
        end
        
    end

end

cash_register = CashRegister.new
cash_register.add_item("burger", 8, 1)
cash_register.add_item("pizza", 5.5, 2)
binding.pry

