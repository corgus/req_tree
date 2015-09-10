# extends acts_as_tree (closure_tree gem)
# using 'position' property to sort w.r.t. siblings

module Sortable
  extend ActiveSupport::Concern

  included do

    before_validation :set_position

    def set_position
      self.position ||= siblings.count
    end

    def <=>(other)
      position > other.position ? 1 : position < other.position ? -1 : 0
    end

    def update_position(new_position)
      return if !new_position && position
      new_position = new_position.to_i
      if target = siblings.find_by(position: new_position)
        if siblings.count == new_position
          target.append_sibling(self)
        else
          target.prepend_sibling(self)
        end
      elsif target = siblings.sort[new_position]
        log "no sibling found with position #{new_position}.\n Prepending to #{target.title}."
        target.prepend_sibling(self)
      elsif siblings
        log "No sibling found with position #{new_position}.\n Appending to end."
        update(position: siblings.count)
      else
        update(position: 0)
      end
    end
  end
end
