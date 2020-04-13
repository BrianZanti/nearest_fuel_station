class NrelService
  def nearest_station(origin)
    response = conn.get('api/alt-fuel-stations/v1/nearest.json') do |req|
      req.params['location'] = origin
      req.params['fuel_type'] = 'ELEC'
      req.params['limit'] = 1
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(
      url: 'https://developer.nrel.gov',
      params: {api_key: ENV['NREL_API_KEY']}
    )
  end
end
