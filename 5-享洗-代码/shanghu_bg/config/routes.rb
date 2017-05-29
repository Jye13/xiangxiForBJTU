Rails.application.routes.draw do
  match 'product/new', :via => [:get, :post]

  post 'product/create'

  match '/show/products' => 'product#showAll', :via => [:get, :post]

  match '/show/all/products' => 'product#showAllProducts', :via => [:get, :post]

  match 'delete/product' => 'product#deleteProduct', :via => [:get, :post]

  match 'category/new', :via => [:get, :post]

  post 'category/create'

  match 'delete/category' => 'category#deleteCategory', :via => [:get, :post]

  match 'show/categories' => 'category#showCategories', :via => [:get, :post]

  match 'login' => 'login#new', :via => [:get, :post]

  post 'login/create'

  match 'logout' => 'login#destroy', :via => [:get, :post]

  match  'register' => 'register#new', :via => [:get, :post]

  match 'register/create', :via => [:get, :post]

  match 'send/mail' => 'register#sendMail', :via => [:get, :post]

  #sprint1 round 2
  match '/region/all' => 'station#getAllRegions', :via => [:get, :post]

  match '/station/destroy' => 'station#destroyStation', :via => [:get, :post]

  match '/station/show' => 'station#showStation', :via => [:get, :post]

  match '/station/all' => 'station#showAllStation', :via => [:get, :post]

  match '/station/first' => 'station#getFirstRegions', :via => [:get, :post]

  match '/product/every' => 'product#showEveryProducts', :via => [:get, :post]

  match '/category/all' => 'category#showAllCategories', :via => [:get, :post]

  match '/station/bind' => 'station#bindMerchant', :via => [:get, :post]

  #spirnt 1 2
  match '/merchant/unproduct' => 'product#showUnProducts', :via => [:get, :post]

  match '/merchant/product/bind' => 'product#bindMerchantProduct', :via => [:get, :post]

  match '/merchant/product/unbind' => 'product#unbindMerchantProduct', :via => [:get, :post]

  match '/product/price/show' => 'product#showPriceProduct', :via => [:get, :post]

  match '/product/price/add' => 'product#addPriceProduct', :via => [:get, :post]

  match '/product/price/remove' => 'product#removePriceProduct', :via => [:get, :post]

  #sprint 1 2
  match '/order/all' => 'order#getAllOrder', :via => [:get, :post]

  match '/order/catch' => 'order#catchOrder', :via => [:get, :post]

  match '/order/my' => 'order#myOrder', :via => [:get, :post]

  match '/order/finsh' => 'order#washFinsh', :via => [:get, :post]

  #sprint 2 1
  match '/user/all' => 'user#allUsers', :via => [:get, :post]

  match '/user/input/money' => 'user#inputMoney', :via => [:get, :post]

  match '/merchant/logs' => 'statistic#log', :via => [:get, :post]

  match '/merchant/discount' => 'statistic#discount', :via => [:get, :post]

  #sprint 2 2
  match '/settlement/get' => 'settlement#getSettlement', :via => [:get, :post]

  match '/download' => 'settlement#download', :via => [:get, :post]

  #final
  match '/withdraw' => 'settlement#withdraw', :via => [:get, :post]

end
