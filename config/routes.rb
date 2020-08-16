Rails.application.routes.draw do
  namespace :v1, defaults: { format: 'json' } do
  end
  get '*path', :to => 'api#render_404'
end
