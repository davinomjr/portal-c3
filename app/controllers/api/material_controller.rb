class Api::MaterialController < ApplicationController

    def index
        @materials = Material.paginate(:page => params[:page], :per_page => 30)
        @json_materials = []
        for material in @materials
            @post = to_json material
            @json_materials << @post
        end
        render :json => @json_materials
    end
    
    def show
        @material = Material.find params[:id]
        
        render :json => to_json(@material)
    end
    
    private
    def to_json(material)
        {
            materialId: material.id,
            materialNome: material.name,
            materialAnexo: material.attachment,
            materialDisciplinaId: material.discipline_id,
            materialProfessorId: material.user_id,
        }
    end

end
