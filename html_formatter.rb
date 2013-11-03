require './data_formater.rb'

class HtmlFormater
  @data = DataFormater.categorize

  def self.format
    index = File.open('./webpage/index.html', 'a')

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
      <div id='graph'>"
    )

    @data.each_key do |key|
      height= @data[key].length
      index.write (
        "<div class='bar_wrapper' data-name='#{key.to_s}'>
          <div class='bar' style='height:#{height}%'></div>
        </div>"
        )

    index.write(

    "</body>
    </html>"

    )
  end

end