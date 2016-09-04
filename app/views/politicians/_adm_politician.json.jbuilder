json.extract! adm_politician, :id, :name, :number, :party, :email, :created_at, :updated_at
json.url adm_politician_url(adm_politician, format: :json)