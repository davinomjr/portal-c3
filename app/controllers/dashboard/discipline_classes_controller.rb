class Dashboard::DisciplineClassesController < Dashboard::AuthenticatedController
  before_action :set_class, only: [:show, :edit, :update, :destroy]

  def index
    redirect_to home_path
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  # DELETE /dashboard/disciplines/1
  # DELETE /dashboard/disciplines/1.json
  def destroy
  end

  private
    def set_class
    end

  def class_param
  end

  def file_param
  end
end
