require 'nokogiri'
require 'open-uri'


def get_cryptos_symbols
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  symbols_scrap = page.xpath('//td[contains(concat(" ",normalize-space(@class)," "), " col-symbol ")]')
  symbols = symbols_scrap.map { |symbol| symbol.text.strip }
  return symbols
end

def get_cryptos_values 
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  values_scrap = page.xpath('//a[contains(concat(" ",normalize-space(@class)," "), " price ")]')
  values = values_scrap.map { |value| value.text.delete("$").to_f }
  return values
end

def create_hashes
  h = Hash[get_cryptos_symbols.zip(get_cryptos_values)]
  # Segmentation du hash en plusieurs hashes au sein d'un array
  result = [h.each {|k,v| Hash[k => v] }]
  puts result
end

create_hashes 