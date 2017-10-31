class Image < ApplicationRecord

 has_attached_file :image
 has_many :ideas

 validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

end
