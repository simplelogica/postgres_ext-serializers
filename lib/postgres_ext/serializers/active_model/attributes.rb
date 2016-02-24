ActiveModel::Serializer::Adapter::Attributes.class_eval do
  include PostgresExt::Serializers::ActiveModel::ArraySerializer

  def relationship_value_for(association, options)
    if ActiveRecord::Relation === association.serializer.object
      _postgres_serializable_array association, options
    else
      super
    end
  end

end
