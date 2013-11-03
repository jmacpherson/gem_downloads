#A collection of methods to format the data we collect into various types and categories

class DataFormater

  @time= Time.new
  @file_name = "./gem_download_stats/gem_percent_#{@time.year}_#{@time.month}_#{@time.day}.txt"

  def self.generate(file)
    percent_gen(file)
  end

  def self.categorize
    categorize_percent
  end

  private

    def percent_gen(file)
    gem_percentage = File.open(@file_name, 'w')
    total = get_total(file).to_f
    list = to_integer(file)

    list.each do |item|
      gem_percentage.write( "#{item[0]},#{(item[1].to_f / total) * 100 }\n" )
    end
    return list
  end

  def categorize_percent
    data = to_float(@file_name)
    gem_sizes = {
      :above1 => [],
      :fromP9to1 => [],
      :fromP8toP9 => [],
      :fromP7toP8 => [],
      :fromP6toP7 => [],
      :fromP5toP6 => [],
      :fromP4toP5 => [],
      :fromP3toP4 => [],
      :fromP2toP3 => [],
      :fromP1toP2 => [],
      :from0toP1 => [],
      :none => 0
    }

    data.each do |item|
      if item[1] >= 1
        gem_sizes[:above1] << item[0]
      elsif item[1] >= 0.9 && item[1] < 1
        gem_sizes[:fromP9to1] << item[0]
      elsif item[1] >= 0.8 && item[1] < 0.9
        gem_sizes[:fromP8toP9] << item[0]
      elsif item[1] >= 0.7 && item[1] < 0.8
        gem_sizes[:fromP7toP8] << item[0]
      elsif item[1] >= 0.6 && item[1] < 0.7
        gem_sizes[:fromP6toP7] << item[0]
      elsif item[1] >= 0.5 && item[1] < 0.6
        gem_sizes[:fromP5toP6] << item[0]
      elsif item[1] >= 0.4 && item[1] < 0.5
        gem_sizes[:fromP4toP5] << item[0]
      elsif item[1] >= 0.3 && item[1] < 0.4
        gem_sizes[:fromP3toP4] << item[0]
      elsif item[1] >= 0.2 && item[1] < 0.3
        gem_sizes[:fromP2toP3] << item[0]
      elsif item[1] >= 0.1 && item[1] < 0.2
        gem_sizes[:fromP1toP2] << item[0]
      elsif item[1] < 0.1 && item[1] != 0
        gem_sizes[:from0toP1] << item[0]
      else
        gem_sizes[:none] << item[0]
      end   
    end
    return gem_sizes
  end

  def list_data(file)
    data = get_data(file)
    return split_data(data)
  end

  def get_data(file)
    file = read_file(file)
    data = file.read
    return data
  end

  def split_data(data)
    data = data.split("\n")
    list = data.map do |index|
      index.split(",")
    end
  end

  def to_integer(file)
    list = list_data(file)

    list.each do |item|
      item[1] =  item[1].to_i
    end 
    return list
  end

  def to_float(file)
    list = list_data(file)

    list.each do |item|
      item[1] =  item[1].to_f
    end 
    return list 
  end

  def read_file(file)
    file = File.open(file, 'r')
  end

  def get_total(file)
    list = to_integer(file)
    total = 0

    list.each do |item|
       total += item[1]
    end
    return total
  end
end