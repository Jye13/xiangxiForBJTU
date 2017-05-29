Rails.application.routes.draw do

  match 'rider/log/get_logs' => 'log#getLogs', :via => [:get, :post]

  match 'rider/orders/send_order_to_station' => 'order#sendtostation', :via => [:get, :post]

  match 'rider/orders/finish_order' => 'order#sendtouser', :via => [:get, :post]

  match 'rider/orders/get_my_orders' => 'riderorder#getmyorder', :via => [:get, :post]

  match 'rider/orders/grab_order' => 'order#graborder', :via => [:get, :post]

  match 'rider/orders/get_orders' => 'order#getorder', :via => [:get, :post]

  match 'rider/goods/getallclasses' => 'category#getCategory', :via => [:get, :post]

  match 'rider/login' => 'login#login', :via => [:get, :post]

  match 'rider/register' => 'register#create', :via => [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
