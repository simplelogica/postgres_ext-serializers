ActiveModel::Serializer::Adapter::Attributes.class_eval do
  include PostgresExt::Serializers::ActiveModel::ArraySerializer

  def  serializable_hash_for_collection(options)
    if ActiveRecord::Relation === self.serializer.object
      _postgres_serializable_array self, options
    else
      super
    end
  end

end
