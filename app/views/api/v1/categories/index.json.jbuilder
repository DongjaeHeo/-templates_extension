json.array! @categories do |category|
  json.extract! category, :id, :title, :user_id
  json.templates category.templates do |template|
    json.extract! template, :id, :title, :content
  end
end
