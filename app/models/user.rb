# Classe de usuário
class User < ActiveRecord::Base
  validates_uniqueness_of :enrollment, :email
  # Funcoes do devise
  # - database_authenticatable: Indica que essa classe é autenticável
  # - registerable: Indica que essa classe é registrável
  # - recoverable: Indica que essa classe possui recuperação de senha
  # - rememberable: Faz com que a autenticação se mantenha em cache
  # - trackable: Indica que essa classe é rastreável (Quantidade de logins, ultimo login, etc)
  # - validatable: Indica que essa classe é validável pelo devise (Tamanho da senha, campos obrigatórios, confirmação da senha)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Enum de nível de usuário
  # são utilizados para saber que tipo de usuário
  # pode ou não criar e/ou remover outros usuários
  enum role: [:admin, :user]

  has_many :articles
  has_many :events
  has_many :discipline_classes
  has_many :materials
  belongs_to :user_profile
  has_and_belongs_to_many :disciplines

  # Para facilitar o uso futuro, foi abreviado para profile apenas
  alias :profile :user_profile
  alias :classes :discipline_classes

  # Define o tipo de imagem que a notícia pode ter
  has_attached_file :avatar, :styles => {
      :medium => ["300x300>", :jpg],
      :thumb => ["100x100>", :jpg]
  }

  # Valida o tipo de arquivo a imagem da notícia pode ser
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def self.reset_password(id, password)
    user = find id
    user.password = password
    user.save
  end

end

  validate :password_complexity

  # Funcoes do devise
  # - database_authenticatable: Indica que essa classe é autenticável
  # - registerable: Indica que essa classe é registrável
  # - recoverable: Indica que essa classe possui recuperação de senha
  # - rememberable: Faz com que a autenticação se mantenha em cache
  # - trackable: Indica que essa classe é rastreável (Quantidade de logins, ultimo login, etc)
  # - validatable: Indica que essa classe é validável pelo devise (Tamanho da senha, campos obrigatórios, confirmação da senha)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Enum de nível de usuário
  # são utilizados para saber que tipo de usuário
  # pode ou não criar e/ou remover outros usuários
  enum role: [:admin, :user]

  has_many :articles
  has_many :events
  has_many :discipline_classes
  has_many :materials
  has_many :oportunities
  belongs_to :user_profile
  has_and_belongs_to_many :disciplines

  # Para facilitar o uso futuro, foi abreviado para profile apenas
  alias :profile :user_profile
  alias :classes :discipline_classes

  # Define o tipo de imagem que a notícia pode ter
  has_attached_file :avatar, :styles => {
      :medium => ["300x300>", :jpg],
      :thumb => ["100x100>", :jpg]
  }
 


  # Valida o tipo de arquivo a imagem da notícia pode ser
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def self.reset_password(id, password)
    user = find id
    user.password = password
    user.save
  end

  def self.starts_with(column_name, prefix)
    where("lower(#{column_name}) like ?", "#{prefix.downcase}%")
  end

     attr_accessor :delete_avatar

  def password_complexity
    if password.present? and not password.match(/^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])/)
      errors.add :password, "deve conter pelo menos um digito, uma letra em maiusculo e uma em minusculo"
    end
  end
end

class User < ActiveRecord::Base
  validates_uniqueness_of :enrollment, :email
  before_validation { avatar.clear if delete_avatar == '1' }