class Question < ApplicationRecord
    belongs_to :user
    has_many :answers
    enum reason: { 
        'I have problem with my account': 0, 
        'Account cancellation': 1, 
        'Other': 2 
    }
end
