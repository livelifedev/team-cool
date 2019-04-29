class Document < ApplicationRecord

  enum type: { essay: 0, presentation: 1 }

end
