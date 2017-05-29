class SettlementController < ApplicationController
  skip_before_filter :verify_authenticity_token
 
  def getSettlement
    @orders = Order.all
    @price = 0
    @arr = []
    File.open(Rails.root + "download/text", "wb") do |file|
      file.write("ID\t价格\t产品\t品类\t创建时间\n")
      @orders.each do |order|
        if params[:data_from] && order.created_at < params[:data_from]
          next
        end
        h = Hash.new
        @product = Product.find(order.product_id)
        h[:id] = order.id
        h[:product] = @product.name
        h[:category] = @product.category.name
        h[:num] = order.product_nums
        h[:order_price] = order.price
        h[:rider_price] = order.price * 0.1
        h[:merchant_price] = order.merchant_price
        h[:operation_price] = order.price - order.discount - order.merchant_price - order.price * 0.1
        h[:time] = order.created_at
        h[:withdraw] = order.withdraw
        if order.withdraw == 1
          @price = @price + order.price - order.discount - order.merchant_price - order.price * 0.1
        end
        file.write("  #{h[:id]}\t#{h[:price]}\t#{h[:product]}\t#{h[:category]}\t#{h[:time]}\n")
          @arr << h
      end
    end
    render :json => {:status => 0, :msg => 'success', :data => {:price => @price, :settlement => @arr}}
  end

  def withdraw
    @orders = Order.where(:withdraw => 1)
    @price = 0
    @orders.each do |order|
      @price = @price + (order.price - order.discount - order.merchant_price - order.price * 0.1)
      order.update_attribute(:withdraw, 0)
    end
    render :json => {:status => 0, :msg => 'success', :data => {:price => @price}}
  end

  def download
    send_file(File.join(Rails.root + "download/text"))
  end
end
