#A collection of methods to format the data we collect into various types and categories

class DataFormater

  # def initialize
    @time= Time.new
    @file_name = "./gem_percentages/gem_percent_#{@time.year}_#{@time.month}_#{@time.day}.txt"
  # end

  def self.generate(file)
    percent_gen(file)
  end

  def self.categorize
    categorize_percent
  end

  def self.get_total_gems(file)
    data = get_data(file)
    return data.length
  end

  private

  def self.percent_gen(file)
    gem_percentage = File.open(@file_name, 'w')
    total = get_total(file).to_f
    list = to_integer(file)
    list.each do |item|
      gem_percentage.write( "#{item[0]},#{(item[1].to_f / total) * 100 }\n" )
    end
    return list
  end

  def self.categorize_percent
    data = to_float(@file_name)
    gem_sizes = {
      "More than 1%" => [],
      "Between 0.9 and 1%" => [],
      "Between 0.8 and 0.9%" => [],
      "Between 0.7 and 0.8%" => [],
      "Between 0.6 and 0.7%" => [],
      "Between 0.5 and 0.6%" => [],
      "Between 0.4 and 0.5%" => [],
      "Between 0.3 and 0.4%" => [],
      "Between 0.2 and 0.3%" => [],
      "Between 0.1 and 0.2%" => [],
      "Between 0 and 0.1%" => [],
      "0%" => []
    }

    data.each do |item|
      if item[1] >= 1
        gem_sizes["More than 1%"] << item[0]
      elsif item[1] >= 0.9 && item[1] < 1
        gem_sizes["Between 0.9 and 1%"] << item[0]
      elsif item[1] >= 0.8 && item[1] < 0.9
        gem_sizes["Between 0.8 and 0.9%"] << item[0]
      elsif item[1] >= 0.7 && item[1] < 0.8
        gem_sizes["Between 0.7 and 0.8%"] << item[0]
      elsif item[1] >= 0.6 && item[1] < 0.7
        gem_sizes["Between 0.6 and 0.7%"] << item[0]
      elsif item[1] >= 0.5 && item[1] < 0.6
        gem_sizes["Between 0.5 and 0.6%"] << item[0]
      elsif item[1] >= 0.4 && item[1] < 0.5
        gem_sizes["Between 0.4 and 0.5%"] << item[0]
      elsif item[1] >= 0.3 && item[1] < 0.4
        gem_sizes["Between 0.3 and 0.4%"] << item[0]
      elsif item[1] >= 0.2 && item[1] < 0.3
        gem_sizes["Between 0.2 and 0.3%"] << item[0]
      elsif item[1] >= 0.1 && item[1] < 0.2
        gem_sizes["Between 0.1 and 0.2%"] << item[0]
      elsif item[1] < 0.1 && item[1] != 0
        gem_sizes["Between 0 and 0.1%"] << item[0]
      else
        gem_sizes["0%"] << item[0]
      end   
    end
    return gem_sizes
  end

  def self.get_data(file)
    open_file = read_file(file)
    data = open_file.read
    data = data.split("\n")
    list = data.map do |index|
      index.split(",")
    end
    list
  end

  def self.to_integer(file)
    list = get_data(file)

    list.each do |item|
      item[1] =  item[1].to_i
    end 
    return list
  end

  def self.to_float(file)
    list = get_data(file)

    list.each do |item|
      item[1] =  item[1].to_f
    end 
    return list 
  end

  def self.read_file(file)
    file = File.open(file, 'r')
  end

  def self.get_total(file)
    list = to_integer(file)
    total = 0

    list.each do |item|
       total += item[1]
    end
    return total
  end
end