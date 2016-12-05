class Event < ActiveRecord::Base
    validates :title, :place, :description, :date, presence: true
    belongs_to :user

        # Define o tipo de imagem que a notícia pode ter
    has_attached_file :image, :styles => { 
        :medium => ["300x300>", :jpg], 
        :thumb => ["100x100>", :jpg] 
    }

    # Valida o tipo de arquivo a imagem da notícia pode ser
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    
     def self.search(search)
        if search
            self.where("title like ?", "%#{search}%");
        else
            self.all
        end
    end
end
