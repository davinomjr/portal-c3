class Dashboard::DisciplinesController < Dashboard::AuthenticatedController
  before_action :set_dashboard_discipline, only: [:show, :edit, :update, :destroy]

  # GET /dashboard/disciplines
  # GET /dashboard/disciplines.json
  def index
    if current_user.admin?
      @dashboard_disciplines_noon = Discipline.order('name').where(shift:Discipline.shifts[:noon]).paginate(:page => params[:pagenoon], :per_page => 10)
      @dashboard_disciplines_night = Discipline.order('name').where(shift:Discipline.shifts[:night]).paginate(:page => params[:pagenight], :per_page => 10)
      @noon = "false"
      @night = "false"
      if params[:noon] == "true"
        @noon = "true"
        params[:night] = "false"
      elsif params[:night] == "true"
        @night = "true"
        params[:noon] = "false"
      end    
    else
     # Acesso não permitido a usuário não ADMIN
    end
  end

  # GET /dashboard/disciplines/1
  # GET /dashboard/disciplines/1.json
  def show
  end

  # GET /dashboard/disciplines/new
  def new
    @dashboard_discipline = Discipline.new
  end

  # GET /dashboard/disciplines/1/edit
  def edit
  end

  # POST /dashboard/disciplines
  # POST /dashboard/disciplines.json
  def create
    @dashboard_discipline = Discipline.new(dashboard_discipline_params)
    respond_to do |format|
      if @dashboard_discipline.save
        flash[:success] = "Disciplina cadastrada com sucesso."
        format.html { redirect_to dashboard_disciplines_path }
        format.json { render :show, status: :created, location: @dashboard_discipline }
      else
        format.html { render :new }
        format.json { render json: @dashboard_discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dashboard/disciplines/1
  # PATCH/PUT /dashboard/disciplines/1.json
  def update
    respond_to do |format|
      if @dashboard_discipline.update(dashboard_discipline_params)
        flash[:success] = "Disciplina alterada com sucesso."
        format.html { redirect_to dashboard_disciplines_path }
        format.json { render :show, status: :ok, location: @dashboard_discipline }    
      else
        format.html { render :edit }
        format.json { render json: @dashboard_discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboard/disciplines/1
  # DELETE /dashboard/disciplines/1.json
  def destroy
    DisciplineClass.destroy_all(:discipline_id => @dashboard_discipline.id)
    Material.destroy_all(:discipline_id => @dashboard_discipline.id)
    @dashboard_discipline.destroy
    respond_to do |format|
        flash[:success] = "Disciplina removida com sucesso."
      format.html { redirect_to dashboard_disciplines_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dashboard_discipline
      @dashboard_discipline = Discipline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dashboard_discipline_params
      params.require(:discipline).permit(:name, :link, :code, :credit, :hours, :semester, :shift, :image, user_ids: [])
    end
end
