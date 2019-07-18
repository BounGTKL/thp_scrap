require 'nokogiri'
require 'rubygems'
require 'open-uri'

def get_deputes_name
    page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
    array_name = page.xpath('//*[@id="deputes-list"]/div/ul/li/a').text
    puts array_name
end
get_deputes_name

def get_deputes_mail

page_2 = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA720798"))
array_mail = page_2.xpath('//a[@class = "email"]')
puts array_mail
end
get_deputes_mail
