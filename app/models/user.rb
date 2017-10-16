class User
  include ActiveModel::Model

  def self.profile(token)
    connection = Faraday.new('http://localhost:3000/api/v1/users/profile')
    response = connection.get do |req|
      req.params['oauth_token'] = token
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end