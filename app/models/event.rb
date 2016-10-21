class Event < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :title, :place
    validates_length_of :description, minimum: 20, allow_blank: false

        # Define o tipo de imagem que a notícia pode ter
    has_attached_file :image, :styles => { 
        :medium => ["300x300>", :jpg], 
        :thumb => ["100x100>", :jpg] 
    }

    # Valida o tipo de arquivo a imagem da notícia pode ser
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    

end
