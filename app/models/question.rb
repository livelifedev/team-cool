class Question < ApplicationRecord
    has_many :answers, dependent: :destroy
    enum reason: { 
        'General enquiries': 0, 
        'I have problem with my account': 1, 
        'Account cancellation': 2, 
        'Other': 3
    }
end
