require './get_data.rb'
require './data_formater.rb'
require './html_formater.rb'

puts "Aquiring Data... please wait."
GetData.run

file_name = GetData.file_name
total_gems = DataFormater.get_total_gems(file_name)

puts "Formating data..."
DataFormater.generate(file_name)
categories = DataFormater.categorize
# puts DataFormater.get_total()
puts "Generating HTML file..."
HtmlFormater.format(categories, total_gems)

puts "Mission complete.  Have a nice day."

