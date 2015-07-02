json.array!(@codes) do |code|
  json.extract! code, :id, :text
  json.url code_url(code, format: :json)
end
