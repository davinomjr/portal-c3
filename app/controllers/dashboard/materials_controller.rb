class Dashboard::MaterialsController < Dashboard::AuthenticatedController
  before_action :set_dashboard_material, only: [:show, :edit, :update, :destroy]
  # GET /dashboard/materials
  # GET /dashboard/materials.json
  def index
    if current_user.admin?
    @dashboard_disciplines = Discipline.includes("materials")
                                       .paginate(:page => params[:page], :per_page => 10)  
                                            
#      @dashboard_disciplines = Discipline.paginate(:page => params[:page], :per_page => 10)
    else
         @dashboard_disciplines = current_user.disciplines    
                                              .includes("materials")
                                              .paginate(:page => params[:page], :per_page => 10)  
      #@dashboard_disciplines = current_user.disciplines.paginate(:page => params[:page], :per_page => 10)
    end
  end


  # GET /dashboard/disciplines/1/edit
  def edit
  end   
   # POST /dashboard/materials
  # POST /dashboard/materials.json
  def create

    @dashboard_material = Material.new(dashboard_material_params)

    respond_to do |format|
      if @dashboard_material.save
        flash[:success] = "Material para disciplina " + @dashboard_material.discipline.name + " cadastrado com sucesso."
        format.html { redirect_to dashboard_materials_path }
        format.json { render :show, status: :created, location: @dashboard_material }
      else
        format.html { render :new }
        format.json { render json: @dashboard_material.errors, status: :unprocessable_entity }
      end
    end
  end
  # GET /dashboard/disciplines/new
  def new
    @selected_discipline = params[:discipline_id] 
    @dashboard_material = Material.new
  end


  # PATCH/PUT /dashboard/materials/1
  # PATCH/PUT /dashboard/materials/1.json
  def update
    respond_to do |format|
      if @dashboard_material.update(dashboard_material_params)
        flash[:success] = "Material alterado com sucesso."
        format.html { redirect_to dashboard_materials_path }
        format.json { render :show, status: :ok, location: @dashboard_material }
      else
        format.html { render :edit }
        format.json { render json: @dashboard_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboard/materials/1
  # DELETE /dashboard/materials/1.json
  def destroy
    Material.destroy_all(:id => @dashboard_material.id)
    @dashboard_material.destroy
    respond_to do |format|
      flash[:success] = "Material removido com sucesso."
      format.html { redirect_to dashboard_materials_path }
      format.json { head :no_content }
    end
  end
   
   private
      # Use callbacks to share common setup or constraints between actions.
    def set_dashboard_material
      @dashboard_material = Material.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dashboard_material_params
      params.require(:material).permit(:name, :attachment, :discipline_id, :user_id)
   end
end
