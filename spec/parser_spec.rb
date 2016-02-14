require_relative '../lib/metar'


describe Metar::Parser do
  let(:metar) { "EDDP 141650Z 24006KT 9999 FEW020 BKN028 06/05 Q0991 NOSIG" }

  it 'parses the ICAO airport code' do
    expect(parse(metar).airport_code).to eql 'EDDP'
  end

  it 'parses the time of observation' do
    expect(parse(metar).day_of_month).to eql(14)
    expect(parse(metar).time).to eql('16:50Z')
  end

  it 'parses the wind direction' do
    expect(parse(metar).wind_direction).to eql(240)
  end

  it 'parses the wind speed' do
    expect(parse("EDDP 141650Z 24006KT 9999 FEW020 BKN028 06/05 Q0991 NOSIG").wind_speed).to eql('6KT')
    expect(parse("LYBE 141730Z 13012KT CAVOK 16/08 Q0996 NOSIG").wind_speed).to eql('12KT')
    expect(parse("ETHC 141720Z 03000KT 2500 -SNRA BR SCT003 BKN005 01/01 Q0993 YLO").wind_speed).to eql('0KT')
  end

  it 'parses the visibility' do
    expect(parse(metar).visibility).to eql(9999)
  end

  def parse(metar)
    Metar::Parser.parse(metar)
  end
end

