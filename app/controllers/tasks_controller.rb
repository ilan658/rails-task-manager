class TasksController < ApplicationController
  # Affiche toutes les tâches
  def index
    @tasks = Task.all
  end

  # Affiche les détails d'une tâche spécifique
  def show
    @task = Task.find(params[:id])
  end

  # Affiche le formulaire pour créer une nouvelle tâche
  def new
    @task = Task.new
  end

  # Crée une nouvelle tâche
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'Tâche créée avec succès.'
    else
      render :new
    end
  end

  # Affiche le formulaire pour éditer une tâche existante
  def edit
    @task = Task.find(params[:id])
  end

  # Met à jour une tâche existante
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task), notice: 'Tâche mise à jour avec succès.'
    else
      render :edit
    end
  end

  # Supprime une tâche
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: 'Tâche supprimée avec succès.'
  end

  private

  # Définit les paramètres autorisés pour créer et mettre à jour une tâche
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
