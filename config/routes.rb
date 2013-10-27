Hzlcgs::Application.routes.draw do

  


  #系统自动生成，定义controller:shipinanquan#cj后，系统自动生成
  get "gongyingshangs/sy"
  get "gongyingshangs/createl"
  get "gongyingshangs/deletel"
  get "gongyingshangs/updatel"
  
  get "xuncharizhis/createl"
  get "xuncharizhis/deletel"
  get "xuncharizhis/updatel"
  get "xuncharizhis/tongzhi_kefu"
  
  get "weiguijilus/createl"
  get "weiguijilus/deletel"
  get "weiguijilus/updatel"

  get "weiguijilus/chaxunfromtongji"
  
  get "xinyongtongjis/gengxin"

  
  get "guifans/daorubiaoge"
  get "guifans/daoru"
  get "guifans/guifandaleis"
  get "guifans/guifanneirongs"
  #match "shipinanquan/sj/:id" => 'shipinanquan#sj'
  #match "shipinanquan/sp/:id" => 'shipinanquan#sp'
  
  
  #自定义，jqury版observer_field ajax查询对应的异步处理动作链接
  match "tanwei/ajaxshanghu/:id" => 'tanweis#ajaxshanghu'
  


  resources :yuangongs
  resources :xinyongtongjis


  resources :weiguijilus


  resources :guifans


  resources :xinyongzhouqis
  resources :xuncharizhis

  resources :xiaozuofangs


  resources :diaoboshangs


  resources :gongyingshangs


  resources :changjia

 #摊位模块内，form_tag ajax查询时，使用search_path
  post "shanghus/search", as: "search"
 #食品安全模块内，form_tag ajax查询时，使用searchs_path
  post "shipinanquan/search", as: "searchs"
  resources :tanweis
  #表单删除js中对应的删除action路由
  match 'tanweis/destroy/:id' => 'tanweis#destroy'

  resources :shangpins


  resources :changshangs


  resources :shanghus

   #表单删除js中对应的删除action路由
  match 'shanghus/destroy/:id' => 'shanghus#destroy'
  #match 'shanghus/search' => 'shanghus#search'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
    
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'users#login'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'

end
