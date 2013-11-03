class HtmlFormater

  def self.format(data)
    index = File.open('./webpage/index.html', 'w')

    index.write(
   "<html>
    <link rel='stylesheet' type='text/css' href='style.css'>
    <script src='http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js'></script>
    <body>
      <h1>Ranges of the total percentage of Gem downloads</h1>
      <div id='y-axis-values'>
        <div class='y-axis-value'>1925</div>
        <div class='y-axis-value'>0</div>
      </div>
      <div id='graph'>\n"
    )

    data.each_key do |key|
      height= data[key].length
      index.write (
        "<div class='bar_wrapper' style='height:#{height}px'>
          <div class='bar' data-name='#{key.to_s}'></div>
        </div>"
        )
    end

    index.write(

    "\n</body>
    </html>"

    )
  end

end