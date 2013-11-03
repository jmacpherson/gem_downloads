require 'rubygems'

def html_formater

  index = File.open('index.html', 'a')

  index.write(
  "<!doctype html>
  <html lang='en'>
  <head>
    <meta charset='UTF-8'>
    <title>Gem Downloads</title>
  </head>
  <body>"
  )

  # data = data.split("\n")
  # list = data.map do |index|
  #   index.split(',')
  # end

  list = list_data("gem_downloads.txt")

  list.each do |item|
    index.write(
    " <div class='wrapper' data-name='#{item[0]}'> 
        <p>Ruby Gem #{item[0]} has #{item[1]} downloads.</p>
      </div>" 
    )
  end
    
  index.write(

  "</body>
  </html>"

  )
end

def list_data(file)
  data = get_data(file)
  split_data(data)
end

def get_data(file)
  file = read_file(file)
  data = file.read
  data
end

def split_data(data)
  data = data.split("\n")
  list = data.map do |index|
    index.split(",")
  end

  list.each do |item|
    item[1] =  item[1].to_i
  end

end

def read_file(file)
  file = File.open(file, 'r')
end

def get_total(file)
  list = list_data(file)
  total = 0

  list.each do |item|
     total += item[1].to_i
  end

  # puts total
  total
end

def percent_gen(file)
  gem_percentage = File.open('gem_percent.txt', 'w')
  total = get_total(file).to_f
  list = list_data(file)

  list.each do |item|
    gem_percentage.write( "#{item[0]},#{(item[1].to_f / total) * 100 }\n" )
  end
end

percent_gen('gem_downloads.txt')


