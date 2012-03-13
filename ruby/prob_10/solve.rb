primes = []
File.open("primes_to_100000000","r") do |file|
  file.each do |line|
    primes= line.split(",")
  end
end
puts "Total of #{primes.count} prime numbers up to #{primes.last}"

sum_of_primes = 0

0.upto(primes.count-1) do |i|
  break if primes[i].to_i > 2000000
  sum_of_primes = sum_of_primes + primes[i].to_i
end

puts "sum = #{sum_of_primes}"
