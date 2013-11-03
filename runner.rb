require 'get_data.rb'
require 'data_formater.rb'
require 'html_formater.rb'

GetData.run
file = GetData.file_name
DataFormater.run(file)
categories = DataFormater.categories

large_size = categories[:large].length
medium_size = categories[:medium].length
small_size = categories[:small].length
none = categories[:none].length

large_names = categories[:large]
medium_names = categories[:medium]
small_names = categories[:small]
none_names = categories[:none]

