module Bootsy
  class ImageGallery < ActiveRecord::Base
    belongs_to :bootsy_resource, polymorphic: true
    has_many :images, dependent: :destroy
    accepts_nested_attributes_for :images, :allow_destroy => true
    
    attr_accessible :bootsy_resource_id, :bootsy_resource_type, :images_attributes

    scope :destroy_orphans, ->(time_limit) { where('created_at < ? AND bootsy_resource_id IS NULL', time_limit).destroy_all }
  end
end
