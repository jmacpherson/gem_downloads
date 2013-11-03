#A collection of methods to format the data we collect into various types and categories

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

def percent_gen(file)
  gem_percentage = File.open('gem_percent.txt', 'w')
  total = get_total(file).to_f
  list = to_integer(file)

  list.each do |item|
    gem_percentage.write( "#{item[0]},#{(item[1].to_f / total) * 100 }\n" )
  end
  return list
end

def categorize_percent
  data = to_float('gem_percent.txt')
  gem_sizes = {
    :large => 0,
    :medium => 0,
    :small => 0,
    :none => 0 
  }

  data.each do |item|
    if item[1] > 1
      gem_sizes[:large] += 1
    elsif item[1] < 1 && item[1] >= 0.1
      gem_sizes[:medium] += 1
    elsif item[1] < 0.5 && item[1] != 0
      gem_sizes[:small] += 1
    else
      gem_sizes[:none] += 1
    end   
  end
  return gem_sizes
end

