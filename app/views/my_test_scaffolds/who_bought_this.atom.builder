atom_feed do |af|
  af.title "Who bougth the #{@my_test_scaffold.title}"

  latest_user_order = @my_test_scaffold.user_orders.sort_by(&:updated_at).last
  af.updated( latest_user_order && latest_user_order.updated_at)

  @my_test_scaffold.user_orders.each do |uo|
    af.entry(uo) do |e|
      e.title "User Order #{uo.id}"
      e.summary :type => 'xhtml' do |x|
        x.p "Shipperd to address: #{uo.user_address}"

        x.table do
          x.tr do
            x.th 'Product'
            x.th 'Quantity'
            x.th 'Price'
          end
          for si in uo.shop_items
            x.tr do
              x.td si.my_test_scaffold.title
              x.td si.quantity
              x.td currency si.total_price
            end
          end
          x.tr do
            x.th 'total', :colspan => 2
            x.th currency uo.shop_items.map(&:total_price).sum
          end
        end

        x.p "Paid by #{uo.user_pay_type}"
      end
      e.author do |a|
        e.name uo.user_name
        e.email uo.user_email
      end
    end
  end
end
