require 'nokogiri'
require 'open-uri'

def get_townhall_infos(townhall_urls)
  townhall_email = Nokogiri::HTML(open(townhall_urls)).xpath('//tr//td[contains(text(),"@")]').text 
  townhall_name = Nokogiri::HTML(open(townhall_urls)).xpath('/html/body/div/main/section[1]/div/div/div/h1').text.capitalize.split.take(1).join 
  hash = {
    townhall_name => townhall_email
  }
end


def get_townhall_urls
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  towns_scrap = page.xpath('//tr//td//p//a[@class="lientxt"]/@href')
  townhall_urls = towns_scrap.map {|link| "http://annuaire-des-mairies.com#{link.text.to_s.delete_prefix(".")}" }
  return townhall_urls
end

def perform
  result = get_townhall_urls.map { |url| get_townhall_infos(url)}
end

puts perform