class GuideCategory < ActiveRecord::Base
  has_many :guides, dependent: :destroy
end
