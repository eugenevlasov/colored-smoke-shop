class Image < ApplicationRecord
  belongs_to :base_good_description

  has_attached_file :image,
    # :default_style => :large,
    styles: {
      :large  => "800x800",
      :medium => "300x300>",
      :small  => "100x100#" }
    #   ,
    # :path => ":rails_root/public/uploads/:id/:style/:filename",
    # :url  => "/uploads/:id/:filename"

  validates_attachment :image,
                        presence: true,
                        content_type: { content_type: "image/jpeg" }
end
