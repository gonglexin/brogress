class Item < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user

  validates :title, presence:     true,
                    uniqueness:   true,
                    length:       { minimum: 2 }

  validates :total, presence:     true,
                    numericality: { greater_than: 0 }

  def percent
    if self.progress
      percent = ((self.progress.to_f / self.total) * 100).round
    else
      percent = 0
    end
    "#{percent}%"
  end
end
