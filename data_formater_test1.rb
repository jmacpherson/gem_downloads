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
  list = get_data("gem_downloads.txt")

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

def get_data(file)
  file = read_file(file)
  data = file.read
  split_data(data)
end

def split_data(data)
  data = data.split("\n")
  list = data.map do |index|
    index.split(",")
  end
  list
end

def read_file(file)
  file = File.open(file, 'r')
end

def get_total (file)
  list = get_data(file)

  total = 0

  list.each do |item|
     total += item[1].to_i
  end

  puts total
  total
end

get_total('gem_downloads.txt')


