class Code < ActiveRecord::Base

  validates :text, presence: true, length: { maximum: 8192 }
end
