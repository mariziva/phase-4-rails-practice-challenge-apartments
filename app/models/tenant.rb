class Tenant < ApplicationRecord
    has_many :apartments
    has_many :leases, through: :apartments

    validates :name, presence: true
    validates :age, numericality: {greater_than_or_equal:18}
end
