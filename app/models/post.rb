class Post < ApplicationRecord
    belongs_to :user
    
    has_many :post_tags
    has_many :tags, through: :post_tags
    
    belongs_to :parent_post, class_name: "Post", optional: true
    has_many :child_posts, class_name: "Post", foreign_key: "parent_post_id"
    
    validates :title, presence: { message: "El título es obligatorio." }
    validates :content, presence: { message: "El contenido es obligatorio." }
    validates :answers_count, numericality: { greater_than_or_equal_to: 0, message: "El recuento de respuestas debe ser mayor o igual a 0." }
    validates :likes_count, numericality: { greater_than_or_equal_to: 0, message: "El recuento de likes debe ser mayor o igual a 0." }
    
    before_validation :set_published_at
    
    private
    
    def set_published_at
      self.published_at ||= Time.now
    end
  end
  