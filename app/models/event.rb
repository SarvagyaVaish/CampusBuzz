class Event < ActiveRecord::Base
  attr_accessible :description, :end_dt, :image, :key, :keytype, :link, :name, :published, :start_dt, :venue_id

  mount_uploader :image, ImageUploader
end
