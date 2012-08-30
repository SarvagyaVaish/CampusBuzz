class Event < ActiveRecord::Base
  attr_accessible :description, :end_dt, :image, :key, :keytype, :link, :name, :published, :start_dt, :venue_id, :remote_image_url

  belongs_to :venue

  has_many :event_categories
  has_many :categories, :through => :event_categories

  mount_uploader :image, ImageUploader
end
