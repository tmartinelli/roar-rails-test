Rails.application.routes.draw do
  scope defaults: { format: :json } do
    resources :beneficiarios, param: :cpf, only: [:index, :show, :create]
    put 'beneficiarios/:cpf' => 'beneficiarios#upsert', as: :upsert_beneficiarios
  end
end
