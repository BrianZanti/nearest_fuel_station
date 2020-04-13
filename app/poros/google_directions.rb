class GoogleDirections
  attr_reader :distance,
              :duration,
              :directions
              
  def initialize(google_data)
    parse_google_data(google_data)
  end

  def parse_google_data(google_data)
    @distance = google_data[:routes].first[:legs].first[:distance][:text]
    @duration = google_data[:routes].first[:legs].first[:duration][:text]
    @directions = parse_directions(google_data)
  end

  def parse_directions(google_data)
    steps = google_data[:routes].first[:legs].first[:steps].map do |step|
      step[:html_instructions]
    end
    steps.join(' ')
  end
end
