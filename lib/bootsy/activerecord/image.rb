module Bootsy
  class Image < ActiveRecord::Base
    belongs_to :image_gallery, touch: true

    mount_uploader :image_file, ImageUploader
    
    attr_accessible :bootsy_resource_id, :bootsy_resource_type

    validates_presence_of :image_file, :image_gallery_id
  end
end
