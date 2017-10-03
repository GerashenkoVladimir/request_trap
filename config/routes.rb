Rails.application.routes.draw do
  get '/', to: 'trap#index', as: 'trap_index'
  get '/:trap_id/requests', to: 'trap#request_list', as: 'request_list'
  match '/:trap_id/*request', to: 'trap#catch_request', as: 'request_trap', via: :all
end
