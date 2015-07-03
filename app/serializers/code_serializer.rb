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
    if object.is_private
      hash['secret_show_url'] = Rails.application.routes.url_helpers.api_v1_secret_code_url(id: object.id,
                                                                                          token: object.token,
                                                                                          host: 'http://localhost:3000' )
    end
    hash
  end
end
