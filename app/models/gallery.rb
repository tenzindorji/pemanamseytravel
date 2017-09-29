class Gallery < ApplicationRecord
  has_many :documents, as: :documentable, dependent: :destroy
  validates_presence_of :title, :notes
  accepts_nested_attributes_for :documents, allow_destroy: true, reject_if: :all_blank
end
