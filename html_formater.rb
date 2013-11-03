class HtmlFormater

  def self.format(data, total_gems)
    index = File.open('./webpage/index.html', 'w')

    index.write(
   "<html>
    <link rel='stylesheet' type='text/css' href='style.css'>
    <script src='http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js'></script>
    <body>
      <h1>Ranges of the total percentage of Gem downloads</h1>
      <div id='y-axis-values'>
        <div class='y-axis-value'>#{total_gems}</div>
        <div class='y-axis-value description'># of Gems</div>
        <div class='y-axis-value'>0</div>
      </div>
      <div id='graph'>
      \t"
    )

    data.each_key do |key|
      height= (data[key].length.to_f / total_gems.to_f) * 100

      index.write (
        "<div class='bar_wrapper' data-name='#{key.to_s}'>
          <div class='bar'  style='height:#{100 - height}%'></div>
        </div>"
        )
    end

    index.write(

    "\n\t\t\t<div id='category'>Hover to see category</div>
    <script src='javascript.js'></script>
    </body>
    </html>"

    )
  end

end