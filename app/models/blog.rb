class Blog < ApplicationRecord
  enum age_group: { everyone: 0, child: 1, adult: 2 }

  validates :title, :body, presence: true
end
