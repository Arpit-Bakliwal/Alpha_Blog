class Category < ApplicationRecord
    validates :name, presesence: true, length: { minimum: 3, maximum: 25 }
    validates_uniqueness_of :name
end