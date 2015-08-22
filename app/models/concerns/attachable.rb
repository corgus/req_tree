module Attachable
  extend ActiveSupport::Concern

  included do
    has_many :attachments, as: :resource, autosave: true
    # accepts_nested_attributes_for :attachments
  end
end
