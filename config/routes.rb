Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'doctor/create' =>'doctor#create'
  get 'doctor/list' =>'doctor#list'
  post 'doctor/modify/:id' => 'doctor#modify#:id'
  delete 'doctor/delete/:id' => 'doctor#delete#:id'
 	
  get 'doctor/searchByName' => 'doctor#searchByName'
  get 'doctor/searchByGender' => 'doctor#searchByGender'
  get 'doctor/searchByCity' => 'doctor#searchByCity'
  get 'doctor/searchByArea' => 'doctor#searchByArea'
  get 'doctor/searchBySpeciality' => 'doctor#searchBySpeciality'
  get 'doctor/searchByExperience' => 'doctor#searchByExperience' 
  get 'doctor/searchByClinic' => 'doctor#searchByClinic' 


end
