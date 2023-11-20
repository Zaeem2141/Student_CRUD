Rails.application.routes.draw do

   root "student#menu"
  #resources :students


   get "new", to:"student#new", as:"add"
   get 'subject/new/:student_id' , to: 'subject#new' , as: 'subject_new'
   post 'student_student/:student_id', to: 'subject#create', as: 'student_subjects'
   get 'student/:student_id/subject/show/:id', to: 'subject#show', as: 'subject_show'
   post "/destroy", to:"student#destroy", as:"destroy"
   get "/destroy/:id", to:"student#destroy", as:"destroyi"
   get "info" , to: 'student#info', as: 'info'
   get "infoU" , to: 'student#infoU', as: 'infoU'
   get "display", to:"student#display", as:"display"
   get "show/:id", to:"student#show", as:"show"
   patch "update/:id", to:"student#update", as:"update"
   post "index" , to: "student#index" , as:"index"
   get 'edit/:id', to: 'student#edit', as: 'edit'
  #post 'edit', to: 'student#update'
   post "/students" , to:"student#create"
  #post "/student/:id" , to:"student#update"
   get "menu", to:"student#menu", as:"menu"
   get "up" => "rails/health#show", as: :rails_health_check

end
