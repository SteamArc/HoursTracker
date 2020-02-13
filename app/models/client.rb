class Client < ApplicationRecord
    has_many :sessions, dependent: :destroy
    
    def total_hours
        sessions.map(&:hours).sum
    end
end