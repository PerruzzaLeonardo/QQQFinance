json.extract! user, :id, :nome, :cognome, :email, :username, :pubblico, :commento, :created_at, :updated_at
json.url user_url(user, format: :json)
