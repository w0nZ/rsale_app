class Product < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  validates :name,  presence: true, length: { minimum: 5, maximum: 20 }
  validates :price, presence: true
  validate  :picture_size
  belongs_to :category

  private
  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end

end
