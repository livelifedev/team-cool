class Question < ApplicationRecord
    # belongs_to :user
    has_many :answers
    enum reason: { 
        'General enquiries': 0, 
        'I have problem with my account': 1, 
        'Account cancellation': 2, 
        'Other': 3
    }
end
