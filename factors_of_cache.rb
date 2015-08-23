
class Factors_of_Cache
				@@factor_map = Hash.new {|h,k| h[k] = Array.new }
				def initialize(array_of_integers)
								@integers = array_of_integers.sort! { |x,y| x <=> y }
				end

				def find_factors(val, array, reverse=false)
								result = Array.new
								if !@@factor_map.has_key?(val)
												@@factor_map[val] = []
								end
								if array.empty?
												return result	
								end
								diff = array - @@factor_map[val]
								diff.each { |x| 
												if val % x == 0 
																@@factor_map[val].push(x)
												end
								}
								result = reverse ? @@factor_map[val] - array : @@factor_map[val] & array
								#puts result.join(',')
								return result

				end

				def print_all_factors
								@integers.each_with_index { |val, index| 
												puts "#{val}:" + find_factors(val, @integers[0, index]).join(',')
								}

				end

				def print_reverse
								@integers.each_with_index { |val, index| 
												puts "#{val}:" + find_factors(val, @integers[0,index], true).join(',') + @integers[index+1..@integers.length-1].join(',')
								}

				end

end

test = Factors_of_Cache.new( [10, 5, 2, 20])


test.print_all_factors
test.print_reverse

testB = Factors_of_Cache.new([2, 6, 15, 5, 30])

testB.print_all_factors
