# ligne très importante qui appelle la gem.
require 'nokogiri'
require 'rubygems'
require 'open-uri'


puts "Hey you... Just wait few secondes to see you Crypto currency. Enjoy :)"

def crypto_array
#determine les tableaux vident
  value = []
  currency = []

#we connect the website
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

# xpath info that we put in the currency sheet
  page.xpath('//a[@class = "link-secondary"]').each do |devise|

    currency << devise.text

  end
#print currency

#get xpath that we put in the value sheet[]
  page.xpath('//a[@class = "price"]').each do |valeur|

    value << valeur.text

  end

#delete the $ in front of the value and we change the argue to float
  value_without_dollar = value.map{|e| e.delete('$').to_f }

# we link name of the money and the value in the hash list
  hash_currency_value = Hash[currency.zip(value_without_dollar.map)]

#puts hash_currency_value

#built a sheet (array)
  array_currency_value = []

#all the elements in the currency_value list
  hash_currency_value.each {|index| array_currency_value << {index[0] => index[1]}}

  return array_currency_value
end

puts crypto_array
