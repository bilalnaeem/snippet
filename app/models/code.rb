class Code < ActiveRecord::Base

  validates :text, presence: true, length: { maximum: 8192 }

  scope :public_codes, -> { where is_private: false  }
end
