# lib/serializers/adapters/oj_adapter.rb

module Serializers
    module Adapters
      class OjAdapter < ActiveModelSerializers::Adapter::Base
        def serializable_hash(options = {})
          # Use Oj to generate the JSON representation of the object
          Oj.dump(serializer.serializable_hash(options))
        end
      end
    end
  end
  