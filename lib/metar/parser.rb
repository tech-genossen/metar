require 'ostruct'

module Metar
  class Parser
    def self.parse(metar)
      new(metar)
    end

    def initialize(metar)
      @metar = metar
      @parts = metar.split
    end

    def airport_code
      @parts[0]
    end

    def wind_direction
      Integer(@parts[2][0..2])
    end

    def wind_speed
      speed_part = @parts[2][3..-1]

      speed = Integer(speed_part.match(/[0-9]+/).to_s)
      unit = speed_part.match(/[A-Z]+/)

      "#{speed}#{unit}"
    end

    def time
      raw_time[2..3] + ":" + raw_time[4..-1]
    end

    def day_of_month
      Integer(raw_time[0..1])
    end

    def raw_time
      @parts[1]
    end

    def visibility
      Integer(@parts[3])
    end
  end
end