Rails.application.routes.draw do
  # Route de vérification de santé de l'application
  get "up" => "rails/health#show", as: :rails_health_check

  # Définir la page d'accueil comme la liste des tâches
  root "tasks#index"

  # Routes pour le gestionnaire de tâches
  get 'tasks', to: 'tasks#index', as: :tasks
  get 'tasks/new', to: 'tasks#new', as: :new_task
  post 'tasks', to: 'tasks#create'
  get 'tasks/:id', to: 'tasks#show', as: :task
  get 'tasks/:id/edit', to: 'tasks#edit', as: :edit_task
  patch 'tasks/:id', to: 'tasks#update'
  delete 'tasks/:id', to: 'tasks#destroy'  # Route pour supprimer une tâche
end
