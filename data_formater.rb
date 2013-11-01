require 'rubygems'

file = File.open('gem_downloads.txt', 'r')
data = file.read
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

data = data.split("\n")
list = data.map do |index|
  index.split(',')
end

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


