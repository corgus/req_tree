class Attachment < ActiveRecord::Base
  belongs_to :resource, polymorphic: true

  enumerize :type, in: [ :image ]
end
