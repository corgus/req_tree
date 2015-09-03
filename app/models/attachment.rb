class Attachment < ReqTree::Base
  extend Enumerize

  belongs_to :resource, polymorphic: true

  enumerize :type, in: [ :image ]

  def resource
    "#{resource_type} #{resource_id}"
  end
end
