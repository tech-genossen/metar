require 'ostruct'

module Metar
  class Parser
    def self.parse(metar)
      parts = metar.split 
      OpenStruct.new(airport: parts.first)
    end
  end
end

describe Metar::Parser do
  it 'parses the airport' do
    metar = 'EDDS 131820Z 17004KT 9999 FEW017 SCT034 BKN053 06/04 Q0986 NOSIG'

    metar = Metar::Parser.parse(metar)
    expect(metar.airport).to eql 'EDDS'
  end
end

