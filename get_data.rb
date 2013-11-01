require 'rubygems'
require 'nokogiri'
require 'open-uri'


doc = Nokogiri::HTML(open("https://www.ruby-toolbox.com/"))
#Populate list with a list of links from the homepage to the gems
links = doc.css('.link')
#Create an array of the url link endings. Sort and delete empty.
urls = links.map {|link| link.attribute('href').to_s }.sort.delete_if {|href| href.empty?}

File.open('gem_downloads.txt', 'w') do |file|
  #Declare array for results
  download_name = Array.new
  #iterate through each page
  urls.each do |url|
    #Go to each webpage
    page = Nokogiri::HTML(open("https://www.ruby-toolbox.com/#{url}"))
    #Iterate through each page extracting project names and download rates
    page.css('.project').each do |item|
      name = item.at_css('.project-label').text
      downloads = item.at_css('.total_downloads .tipsy-n') 
      #Set nils to 0.
      downloads.nil? ? downloads = 0 : downloads = downloads.text
      download_name << "[#{downloads}, #{name}]"
    end
  end
  #Sort array for largest downloads first
  file.write(download_name.sort!)
end

