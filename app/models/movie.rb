class Movie < ActiveRecord::Base
  has_many :reviews

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validates :img_url,
    presence: true

  def review_average
    reviews.sum(:rating_out_of_ten)/reviews.size
  end

  # validates :release_date,
  #   presence: true

  # validate :release_date_is_in_the_future

  # protected

  # def release_date_is_in_the_future
  #   if release_date.present?
  #     errors.add(:release_date, "should probably be in the future") if release_date < Date.today
  #   end


end
