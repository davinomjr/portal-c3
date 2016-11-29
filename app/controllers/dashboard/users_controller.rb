class Dashboard::UsersController < Dashboard::AuthenticatedController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @user = User.new
    @user.user_profile = UserProfile.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.user_profile = UserProfile.new(profile_params)
    respond_to do |format|
      if @user.save
        @user.user_profile.save
        flash[:success] = "Usuário cadastrado com sucesso."
        if current_user.admin?
          format.html { redirect_to dashboard_users_path }
        else
          format.html { redirect_to dashboard_root_path }
        end
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        @user.user_profile.update profile_params
        flash[:success] = "Usuário alterado com sucesso."
          if current_user.admin?
          format.html { redirect_to dashboard_users_path }
        else
          format.html { redirect_to dashboard_root_path }
        end
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    profile = @user.user_profile
    @user.materials.delete(@user.materials)
    @user.destroy
    profile.destroy
    respond_to do |format|
      flash[:success] = "Usuário removido com sucesso."
      format.html { redirect_to dashboard_users_path }
      format.json { head :no_content }
    end
  end

  private
  def set_user
    @user = User.find_by_id params[:id]
  end

  def user_params
    user = params.require(:user).permit!
    if user[:password].nil? or user[:password].empty?
      user.delete :password
      user.delete :password_confirmation
    end
    user
  end

  def profile_params
    profile = params.require(:user_profile).permit!
    if profile[:is_teacher] == '0'
      profile[:is_teacher] = false
    else
      profile[:is_teacher] = true
    end
    profile
  end
end
