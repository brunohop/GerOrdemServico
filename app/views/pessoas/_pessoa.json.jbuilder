json.extract! pessoa, :id, :nome, :vinculo, :id_pessoa_redmine, :created_at, :updated_at
json.url pessoa_url(pessoa, format: :json)
