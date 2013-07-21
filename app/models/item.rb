class Item < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user

  scope :published, -> { where(public: true) }

  validates :title, presence: true

  validates :total, presence: true,
                    numericality: { greater_than: 0 }

  validates :progress, presence: true,
                       numericality: { greater_than_or_equal_to: 0,
                                       less_than_or_equal_to: :total }

  def percent
    if self.progress
      percent = ((self.progress.to_f / self.total) * 100).round
    else
      percent = 0
    end
    "#{percent}%"
  end
end
