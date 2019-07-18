require_relative '../lib/mairie_christmas'

describe "get_townhall_urls method" do
  it "checks if it get townhall urls" do
    expect(get_townhall_urls).not_to be_nil
end
end

describe "get_townhall_infos method" do
  it "checks if it get townhall infos" do
    expect(get_townhall_infos('http://annuaire-des-mairies.com/95/wy-dit-joli-village.html')).to eq({"Wy-dit-joli-village"=>"mairie.wy-dit-joli-village@wanadoo.fr"})
end
end