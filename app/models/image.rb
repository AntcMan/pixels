class Image < ApplicationRecord
  attr_accessor :date_uploaded
  belongs_to :user
  has_one_attached :image
end
