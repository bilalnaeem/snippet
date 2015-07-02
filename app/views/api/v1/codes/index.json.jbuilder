json.partial! "api/v1/shared/success"
json.codes do
  json.array! @codes do |code|
    json.partial! "api/v1/codes/code", code: code, except: []
  end
end
