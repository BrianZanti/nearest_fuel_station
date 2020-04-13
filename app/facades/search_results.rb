class SearchResults
  def initialize(location)
    nrel_json = NrelService.new.nearest_station(location)
    @station = FuelStation.new(nrel_json)
    google_json = GoogleService.new.directions(location, @station.address)
    @google_directions = GoogleDirections.new(google_json)
  end

  def name
    @station.name
  end

  def address
    @station.address
  end

  def type
    @station.type
  end

  def access_times
    @station.access_times
  end

  def distance
    @google_directions.distance
  end

  def duration
    @google_directions.duration
  end

  def directions
    @google_directions.directions
  end
end
