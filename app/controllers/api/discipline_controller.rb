class Api::DisciplineController < ApplicationController

    def index
        @disciplines = Discipline.all
        @json_disciplines = []
        for oportunity in @disciplines
            discipline = to_json oportunity
            @json_disciplines << discipline
        end
        render :json => @json_disciplines
    end
    
    private
    def to_json(discipline)
        {
            disciplinaId: discipline.id,
            disciplinaCodigo: discipline.code,
            disciplinaNome: discipline.name,
            disciplinaLinkPlanoAcademico: discipline.link,
            disciplinaCreditos: discipline.credit,
            disciplinaCargaHoraria: discipline.hours,
            disciplinaTurno: discipline.shift,
            disciplinaPeriodo: discipline.semester
        }
    end

end
