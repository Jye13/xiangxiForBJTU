class SettlementController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def getSettlement
    if params[:merchant_id]
      @incomes = Merchant.find(params[:merchant_id]).merchant_incomes
      @arr = []
      @b = []
      @prices = 0
      File.open(Rails.root + "download/text", "wb") do |file|
        file.write("价格\t产品\t品类\t商品数量\t创建时间\n")
        @incomes.each do |income|
          h = Hash.new
          h[:price] = income.price
          @order = Order.find(income.order_id)
          if params[:data_from] && @order.created_at < params[:data_from]
            next
          end
          @product = Product.find(@order.product_id)
          if params[:category_id] && params[:category_id] != @product.category.id.to_s
            next
          end
          h[:product] = @product.name
          h[:category] = @product.category.id
          h[:product_num] = @order.product_nums
          h[:time] = income.created_at
          h[:order_id] = income.order_id
          h[:is_settlement] = income.is_settlement
          if income.is_settlement == 1
            @prices = @prices + income.price
          end
          file.write("  #{h[:price]}\t#{h[:product]}\t#{h[:category]}\t#{h[:product_num]}\t#{h[:time]}\n")
          @arr << h
        end
      end
      render :json => {:status => 0, :msg => 'success', :data => {:price => @prices, :settlement => @arr}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def withdraw
    if params[:merchant_id]
      @incomes = Merchant.find(params[:merchant_id]).merchant_incomes.where(:is_settlement => 1)
      @price = 0
      @incomes.each do |income|
        @price = @price + income.price
        income.update_attribute(:is_settlement, 0)
      end
      render :json => {:status => 0, :msg => 'success', :data => {:price => @price}}
    else
      render :json => {:status => 1, :msg => '参数问题'}
    end
  end

  def download
    send_file(File.join(Rails.root + "download/text"))
  end
end
