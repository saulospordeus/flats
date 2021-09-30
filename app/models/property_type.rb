class PropertyType < ApplicationRecord
    has_many :properties
    validates :name, presence: { message: 'não pode ficar em branco' }
    validates :name, uniqueness: { message: 'tem de ser único' }

end
