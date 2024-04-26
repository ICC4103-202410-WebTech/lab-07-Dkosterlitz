class Tag < ApplicationRecord
    # Relación muchos-a-muchos con las publicaciones
    has_many :post_tags
    has_many :posts, through: :post_tags
  
    # Validaciones
    validates :name, presence: { message: "El nombre es obligatorio." }, uniqueness: { message: "La etiqueta ya existe." }
  end
  