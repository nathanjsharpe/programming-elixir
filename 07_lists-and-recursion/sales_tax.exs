defmodule SalesTax do
  def orders_with_totals(orders, tax_rates) do
    orders |> Enum.map(&add_total_to(&1, tax_rates))
  end

  def add_total_to([id: i, ship_to: st, net_amount: amt], tax_rates) do
    [id: i, ship_to: st, net_amount: amt, net_amount: amt, total_amount: amt + (tax_rates[st] || 0) * amt]
  end

  def example_orders do
    [ [ id: 123, ship_to: :NC, net_amount: 100.00 ],
      [ id: 124, ship_to: :OK, net_amount:  35.50 ],
      [ id: 125, ship_to: :TX, net_amount:  24.00 ],
      [ id: 126, ship_to: :TX, net_amount:  44.80 ],
      [ id: 127, ship_to: :NC, net_amount:  25.00 ],
      [ id: 128, ship_to: :MA, net_amount:  10.00 ],
      [ id: 129, ship_to: :CA, net_amount: 102.00 ],
      [ id: 120, ship_to: :NC, net_amount:  50.00 ] ]
  end

  def taxes, do: [ NC: 0.075, TX: 0.08 ]
end