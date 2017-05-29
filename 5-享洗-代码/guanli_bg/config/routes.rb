Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm

  match '/manage/rider' => 'manage#manageRider', :via => [:get, :post]

  match '/stop/rider' => 'manage#stopRider', :via => [:get, :post]

  match '/active/rider' => 'manage#activeRider', :via => [:get, :post]

  match '/manage/merchant' => 'manage#manageMerchant', :via => [:get, :post]

  match '/stop/merchant' => 'manage#stopMerchant', :via => [:get, :post]

  match '/active/merchant' => 'manage#activeMerchant', :via => [:get, :post]

  match '/manage/user' => 'manage#manageUser', :via => [:get, :post]

  match '/review/merchant' => 'review#reviewMerchant', :via => [:get, :post]

  match '/post/merchant' => 'review#postMerchant', :via => [:get, :post]

  match '/review/rider' => 'review#reviewRider', :via => [:get, :post]

  match '/post/rider' => 'review#postRider', :via => [:get, :post]

  match '/login' => 'login#create', :via => [:get, :post]

  match '/logout' => 'login#destroy', :via => [:get, :post]

  match '/show/admin' => 'admin#showAdmin', :via => [:get, :post]

  match '/add/admin' => 'admin#addAdmin', :via => [:get, :post]

  match '/remove/admin' => 'admin#removeAdmin', :via => [:get, :post]

  match '/statistic/sex' => 'statistic#statisticSex', :via => [:get, :post]

  match '/edit/admin' => 'admin#edit', :via => [:get, :post]

  match '/category/list' => 'category#list', :via => [:get, :post]

  match '/product/edit' => 'product#edit', :via => [:get, :post]

  match '/user/list' => 'user#list', :via => [:get, :post]

  match '/user/stop' => 'user#stopUser', :via => [:get, :post]

  match '/user/active' => 'user#activeUser', :via => [:get, :post]

  match '/product/list' => 'product#list', :via => [:get, :post]

  match '/product/stop' => 'product#stopProduct', :via => [:get, :post]

  match '/category/stop' => 'category#stopCategory', :via => [:get, :post]

  match '/category/add' => 'category#addCategory', :via => [:get, :post]

  match '/product/add' => 'product#addProduct', :via => [:get, :post]

  match '/category/edit' => 'category#edit', :via => [:get, :post]

  #spring1 round2

  match '/station/show' => 'station#showAdminStation', :via => [:get, :post]

  match '/region/show' => 'region#showAdminRegion', :via => [:get, :post]

  match '/station/destroy' => 'station#destroyAdminStation', :via => [:get, :post]

  match '/region/all' => 'region#getAllRegions', :via => [:get, :post]

  match '/station/create' => 'station#createStation', :via => [:get, :post]

  match '/function' => 'function#allFuntion', :via => [:get, :post]

  match '/station/all' => 'station#showAllStation', :via => [:get, :post]

  #骑手
  match '/rider/show' => 'rider#showRider', :via => [:get, :post]

  match '/rider/bind' => 'rider#bindRider', :via => [:get, :post]

  match '/rider/unbindRider' => 'rider#unbindRider', :via => [:get, :post]

  match '/rider/station' => 'rider#stationRider', :via => [:get, :post]

  match '/rider/unstation' => 'rider#unstation', :via => [:get, :post]

  #商户
  match '/merchant/station' => 'merchant#stationMerchant', :via => [:get, :post]

  match '/merchant/bind' => 'merchant#bindMerchant', :via => [:get, :post]

  match '/merchant/unbind' => 'merchant#unbindMerchant', :via => [:get, :post]

  match '/merchant/unstation' => 'merchant#unstation', :via => [:get, :post]

  #statistic
  match '/region/statistic' => 'statistic#statisticRegion', :via => [:get, :post]

  #sprint 1 2
  match '/product/price/show' => 'product#showProductPrice', :via => [:get, :post]

  match '/product/price/add' => 'product#addProductPrice', :via => [:get, :post]

  #sprint 2 1
  match '/coupon/create' => 'coupon#create', :via => [:get, :post]

  match '/coupon/show' => 'coupon#show', :via => [:get, :post]

  match '/user/card' => 'user#card', :via => [:get, :post]

  match '/user/input/money' => 'user#inputMoney', :via => [:get, :post]

  match '/logs' => 'statistic#logs', :via => [:get, :post]

  match '/coupon/user' => 'coupon#userCoupon', :via => [:get, :post]

  match '/coupon/not' => 'coupon#notUserCoupon', :via => [:get, :post]

  match '/coupon/catch' => 'coupon#catch', :via => [:get, :post]

  match '/coupon/user/delete' => 'coupon#userDelete', :via => [:get, :post]

  #sprint 2 2
  match '/settlement/get' => 'settlement#getSettlement', :via => [:get, :post]

  match '/download' => 'settlement#download', :via => [:get, :post]

  #final
  match '/withdraw' => 'settlement#withdraw', :via => [:get, :post]

  match '/role/list' => 'role#roleList', :via => [:get, :post]

  match '/role/service' => 'role#roleService', :via => [:get, :post]

  match '/role/not' => 'role#notService', :via => [:get, :post]

  match '/role/add' => 'role#addService', :via => [:get, :post]

  match '/admin/single' => 'admin#singleAdmin', :via => [:get, :post]

  match '/role/service/delete' => 'role#deleteService', :via => [:get, :post]

  #final final
  match '/region/province' => 'region#getFirstReginos', :via => [:get, :post]

  match '/advertisement/add' => 'advertisement#addAd', :via => [:get, :post]

  match '/advertisement/product' => 'advertisement#allProduct', :via => [:get, :post]

  match '/advertisement/push' => 'advertisement#push', :via => [:get, :post]
 
  match '/advertisement/list' => 'advertisement#adList', :via => [:get, :post]

  match '/advertisement/del' => 'advertisement#delAd', :via => [:get, :post]

  match '/coupon/del' => 'coupon#del', :via => [:get, :post]

  match '/coupon/push/all' => 'coupon#pushAllUser', :via => [:get, :post]

  match '/suggest/price' => 'manage#showSuggestPrice', :via => [:get, :post]

  match '/post/suggest/price' => 'manage#manageSuggestPrice', :via => [:get, :post]
end
