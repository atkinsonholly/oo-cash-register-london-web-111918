class CashRegister

  attr_accessor :total, :last_transaction

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def total
    @total
  end

  def discount
    @discount
  end

  def add_item(name, price_float, quantity=1)
    quantity.times {@items << name}
    @last_transaction = [name, price_float]
    @total += price_float*quantity #see also .inject

  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    end
    @total = @total*(100-@discount)/100
    "After the discount, the total comes to $#{@total}."
  end

  def items
    @items
  end

  def void_last_transaction
    @items = @items.pop
    @total = @total - @last_transaction[1]
  end

end
