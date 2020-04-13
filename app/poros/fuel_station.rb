class FuelStation
  attr_reader :address,
              :name,
              :type,
              :access_times

  def initialize(nrel_data)
    parse_nrel_data(nrel_data)
  end

  def parse_nrel_data(nrel_data)
    @name = nrel_data[:fuel_stations].first[:station_name]
    @address = parse_address(nrel_data)
    @type = nrel_data[:fuel_stations].first[:fuel_type_code]
    @access_times = nrel_data[:fuel_stations].first[:access_days_time]
  end

  def parse_address(nrel_data)
    city = nrel_data[:fuel_stations].first[:city]
    state = nrel_data[:fuel_stations].first[:state]
    street_address = nrel_data[:fuel_stations].first[:street_address]
    zip = nrel_data[:fuel_stations].first[:zip]
    "#{street_address} #{city}, #{state} #{zip}"
  end
end
