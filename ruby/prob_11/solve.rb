def get_val_at(x,y,dataset)
  puts "looking for #{x} , #{y}"
  dataset[x][y]
end

dataset = Array[]

File.open("dataset","r") do |file|
  file.each do |line|
    dataline = Array[]
    dataline = line.chomp.split(" ").map { |number| number.to_i }
    dataset.push(dataline)
  end
end

puts ("--- #{dataset.inspect}")


up = [ [0,0], [0,-1], [0,-2], [0,-3] ]
up_diag = [ [0,0] , [-1,1], [-2,2], [-3,3]]
down_diag = [ [0,0], [1,1] , [2,2], [3,3]]
across = [ [0,0] , [1,0] , [2,0] , [3,0] ]

x_position = 0
y_position = 0

max_x = 19
max_y = 19
max_product = 0
max_products = nil
dataset.each do |data_line|
  data_line.each do |data_point|
    product = 1
    skip = false 
    products = Array[]
    up.each do |coord|
      skip = true if (x_position+coord[0]) > max_x || (y_position+coord[1]) > max_y
      products.push(get_val_at((x_position+coord[0]),(y_position+coord[1]),dataset)) if skip == false
    end

    if skip == false
      products.each { |value| product = product * value}
      if product > max_product
        max_product = product
        max_products = products
      end
    end

    product = 1
    skip = false 
    products = Array[]
    up_diag.each do |coord|
      skip = true if (x_position+coord[0]) > max_x || (y_position+coord[1]) > max_y
      products.push(get_val_at((x_position+coord[0]),(y_position+coord[1]),dataset)) if skip == false
    end

    if skip == false
      products.each { |value| product = product * value}
      if product > max_product
        max_product = product
        max_products = products
      end
    end
    
 
    products = []
    skip = false
    product = 1

    down_diag.each do |coord|
      skip = true if (x_position+coord[0]) > max_x || (y_position+coord[1]) > max_y
      puts "-- #{coord.inspect}"
      products.push(get_val_at((x_position+coord[0]),(y_position+coord[1]),dataset)) if skip == false
    end

    if skip == false
      products.each { |value| product = product * value}
      if product > max_product
        max_product = product
        max_products = products
      end
    end

    skip = false
    product = 1
    products = []

    across.each do |coord|
      skip = true if (x_position+coord[0]) > max_x || (y_position+coord[1]) > max_y
      products.push(get_val_at((x_position+coord[0]),(y_position+coord[1]),dataset)) if skip == false
    end
    if skip == false
      products.each { |value| product = product * value}
      if product > max_product
        max_product = product
        max_products = products
      end
    end
    x_position = x_position+1
  end
  y_position = y_position + 1
  x_position = 0
end
puts "max = #{max_product}; - by -- #{max_products}"
