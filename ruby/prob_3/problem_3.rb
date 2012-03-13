file_of_primes = File.new("primes_to_100000000","w")
state = Numeric.new
file_of_primes.print "2,3,"
(4..100000000).each do
   |i|
   (2..(Math.sqrt(i).ceil)).each do
      |thing|
      state = 1
      if (i.divmod(thing)[1] == 0)
         state = 0
         break
      end
   end
   file_of_primes.print "#{i}\," unless (state == 0)
end
