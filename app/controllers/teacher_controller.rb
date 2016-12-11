class TeacherController < ApplicationController
  def show
    begin
      @teacher = User.where(id: params[:id]).
          joins(:user_profile).
          eager_load(:disciplines).
          eager_load(:materials).
          first
    rescue
      redirect_to not_found_path()
    end
  end

  def index
    @teachers = User.joins(:user_profile).
        eager_load(:disciplines).
        eager_load(:materials).
        where("user_profiles.is_teacher = true").
        paginate(:page => params[:page], :per_page => 30)
  end
end
