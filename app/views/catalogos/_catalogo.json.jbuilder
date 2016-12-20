json.extract! catalogo, :id, :nome,:tipo, :created_at, :updated_at
json.url catalogo_url(catalogo, format: :json)
