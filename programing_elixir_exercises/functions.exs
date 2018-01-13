#Task sis create the following funcations, anonymous
#
#
#list_concat.([:a, :b], [:c, :d]) #=> [:a, :b, :c, :d]
#sum.(1, 2, 3) #=> 6
#pair_tuple_to_list.( { 1234, 5678 } ) #=> [ 1234, 5678 ]

list_concat = fn (a,b) ->  a ++ b end
sum = fn (a,b,c) -> a+b+c end
pair_tuple_to_list = fn {a, b} ->  [a, b] end

#funcations 2

#This funcation achieve the required outcome.

decider = fn 
    {0,0,a} -> IO.puts("FizzBuzz")
    {0,_,a} -> IO.puts("Fizz")
    {_,0,a} -> IO.puts("Buzz")
    {_,_,a} -> IO.puts(a)
end

#I had to peak on this one to be fare, I didnt really get the question
#To run it you use this code: [ devider.(10), devider.(11), devider.(12), devider.(13), devider.(14), devider.(15), devider.(16) ]

devider = fn n ->
    decider.({rem(n, 3), rem(n, 5), n})
end


#Funcation 4
prefix = fn title -> (fn name -> "#{title} #{name}" end) end
#
#mrs = prefix.("Mrs")
#mrs.("Smith")
#prefix.("Elixir").("Rocks")


#Funcations 5 
#The & is like one of the collest things ever :D
#Enum.map [1,2,3,4], fn x -> x + 2 end
Enum.map [1,2,3,4], &( &1 + 2)
#Enum.each [1,2,3,4], fn x -> IO.inspect x end
Enum.map [1,2,3,4], &(IO.inspect  &1)

