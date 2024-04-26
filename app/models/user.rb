class User < ApplicationRecord

  has_many :posts
  validates :name, presence: { message: "El nombre es obligatorio." }
  validates :email, presence: { message: "El es obligatorio." }, uniqueness: { message: "El correo ya está en uso." }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "El formato no es válido." }
  validates :password, presence: { message: "La contraseña es obligatoria." }, length: { minimum: 6, message: "La contraseña debe tener al menos 6 caracteres." }

end