require './data_formater.rb'

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

  #generator to go here
    
  index.write(

  "</body>
  </html>"

  )
end