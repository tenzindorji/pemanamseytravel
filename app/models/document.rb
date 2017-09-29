class Document < ApplicationRecord
  belongs_to :documentable, polymorphic: true, dependent: :destroy, optional: true
  validates_presence_of :image
  has_attached_file :image,
                    {
                        styles: { thumb: ["360x194#", :jpg] }, preserve_files: "true",
                        url: "/uploads/attachments/:basename.:extension",
                        path: ":rails_root/public/uploads/attachments/:basename.:extension",
                    }
  validates_attachment :image, content_type: { content_type: %w(image/jpeg image/gif image/png image/bmp) }
  validates_attachment_size :image, less_than: 25.megabytes
end
