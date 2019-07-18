require_relative '../lib/dark_trader'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

describe "create_hashes method" do 
  it "scrap cryptocurrencies symbols & values" do
    expect(create_hashes).not_to be_nil
  end
end

describe "get_cryptos_symbols" do 
  it "check if it gets crypto symbols" do
  expect(get_cryptos_symbols).to include("BTC")
  expect(get_cryptos_symbols).to include("GRAT")
  expect(get_cryptos_symbols).to include("ERA")
  end
end