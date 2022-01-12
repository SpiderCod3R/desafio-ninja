Rails.application.routes.draw do
  api_version(module: "V1", path: { value: "v1" }) do
    resources :enterprises do
      resource :room, only: [:list, :create, :update, :destroy]
    end
  end
end
