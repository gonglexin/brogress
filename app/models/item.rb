class Item < ActiveRecord::Base

  validates :title, presence:     true,
                    uniqueness:   true,
                    length:       { minimum: 2 }

  validates :total, presence:     true,
                    numericality: true
end
