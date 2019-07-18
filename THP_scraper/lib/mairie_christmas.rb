require 'rubygems'
require 'nokogiri'
require 'open-uri'

puts "Please find below the email list from the the Val D'oise Town Hall. Enjoy ;-)"

# We define the function emails_from_webpage with url settings (townhall_url)
def emails_from_webpage (townhall_URL)
	page = Nokogiri::HTML(open(townhall_URL))                                          # We get the city name unsing element inspector
	name_town = page.xpath("/html/body/div[1]/main/section[1]/div/div/div/h1").text    # We get the email using element inspector
	mail_adress = page.xpath("/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]").text
	return name_town, mail_adress
end

# We define the function urls_of_val_doise_townhalls
def urls_of_val_doise_townhalls
	url_parent = "http://annuaire-des-mairies.com/"                # The parent page url which list the town hall pages url
	page = Nokogiri::HTML(open(url_parent+"/val-d-oise.html"))     # url from the page and the specific town link
	urls_array = page.xpath('//a[@class = "lientxt"]').map { |node| url_parent + node.attributes["href"].value[1..-1] }
	return urls_array # urls sheet
end

# We define the function name_and_email_val_doise
def name_and_email_val_doise
	result = []
	list_url = urls_of_val_doise_townhalls # city pages urls
	list_url.each { |town_url| name, mail = emails_from_webpage(town_url); result.push({:name => name.to_s, :email => mail}) }   # name & email from each city
	puts result; # un tableau avec le nom et le mail des mairies
end

def perform
	name_and_email_val_doise
end

perform
