class UsageHistory < ApplicationRecord
  belongs_to :user
  belongs_to :ai_module
  belongs_to :ai_request
end
