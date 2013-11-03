require './get_data.rb'
require './data_formater.rb'
require './html_formater.rb'

# puts "Aquiring Data... please wait."
# GetData.run
file = GetData.file_name
puts "Formating data..."
DataFormater.generate(file)
categories = DataFormater.categorize
puts "Generating HTML file..."
HtmlFormater.format(categories)

