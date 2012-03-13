primes = []
File.open("primes_to_100000000","r") do |file|
  file.each do |line|
    primes= line.split(",")
  end
end

puts "Total of #{primes.count} prime numbers up to #{primes.last}"

starting_val = 600851475143

prime_factors = []

new_remainder = starting_val
(primes.count-1).downto(0) do |i|
  if new_remainder%primes[i].to_i == 0
    new_remainder = new_remainder/primes[i].to_i
    prime_factors.push(primes[i])
  end
  break if new_remainder == 1
end

puts "primes = #{prime_factors.inspect}"
