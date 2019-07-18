require 'nokogiri'
require 'open-uri'

def get_deputy_infos(deputy_urls)
  page = Nokogiri::HTML(open(deputy_urls))
  hash = {
    "first_name" => page.xpath('//h1').text.split[0],
    "last_name" => page.xpath('//h1').text.split[1..-1].join(" "),
    "email" => page.xpath('//a[contains(text(),"@assemblee-nationale.fr")]').text,
  }
end

def get_deputy_urls
  page = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))
  deputys_scrap = page.xpath('//td//a/@href')
  deputy_urls = deputys_scrap.map {|link| "https://www.nosdeputes.fr#{link}" }
  return deputy_urls
end

def perform
  result = get_deputy_urls.map { |url| get_deputy_infos(url)}
end

puts perform
