require 'representable'
module Roar::Representer::Feature::Hypermedia
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def query(name, &block)

    end
  end
end
