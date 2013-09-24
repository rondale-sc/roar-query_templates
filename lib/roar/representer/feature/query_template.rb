module Roar
  module Representer
    module Feature

      module Hypermedia

        def self.included(base)
          base.extend(ClassMethods)
          base.extend(InheritableArray)
        end

        def queries
          @queries ||= QueryCollection.new
        end

        def query_array
          queries
        end

        module QueryConfigs
          def query_configs
            representable_attrs.inheritable_array(:queries)
          end
        end

        module ClassMethods
          def query(&block)
            query_template_builder = QueryTemplateBuilder.new
            yield query_template_builder

            require 'pry'; binding.pry
            query_configs << query_template_builder
          end

          include QueryConfigs
        end

      end

    end
  end
end
