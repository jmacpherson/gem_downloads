require 'rubygems'

def get_total (file)
  file = File.open( file , 'r')
  data = file.read

  data = data.split("\n")
  list = data.map do |index|
    index.split(",")
  end

  total = 0

  list.each do |item|
     total += item[1].to_i
  end

  puts total
  total
end

get_total('gem_downloads.txt')