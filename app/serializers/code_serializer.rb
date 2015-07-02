class CodeSerializer < ActiveModel::Serializer
  attributes :code_id,
             :text,
             :is_private

  def code_id
    object.id
  end

  def text
    object.text
  end

  def is_private
    object.is_private
  end



  def attributes
    hash = super
    hash
  end
end
