module RawPostHelper

  def raw_post(action, data, parameters = {})
    post action, data.to_json, data.merge(parameters.reverse_merge(format: "json"))
  end

end
