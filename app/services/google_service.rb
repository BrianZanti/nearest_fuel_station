class GoogleService
  def directions(origin, destination)
    response = conn.get('maps/api/directions/json') do |req|
      req.params['destination'] = destination
      req.params['origin'] = origin
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(
      url: 'https://maps.googleapis.com',
      params: {key: ENV['GOOGLE_API_KEY']}
    )
  end
end
