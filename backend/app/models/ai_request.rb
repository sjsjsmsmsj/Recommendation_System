class AiRequest < ApplicationRecord
  belongs_to :user
  belongs_to :ai_module
end
