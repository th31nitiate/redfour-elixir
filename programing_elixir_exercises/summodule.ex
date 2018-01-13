#This one was a bit strange, I didnt really get the requirements.
#I kinda get a bit when I look ar rge n-1 going in to sum
#
#So basically it is recursing the list and created the range. I get confused when I think about the memory.
#this means the n before the + has to retain its state. possible that state might just be left as pointer or something.
#

defmodule Calcint do
    def sum(0), do: 0
    def sum(n), do: n + sum(n-1)


    #The largest common divsor :/ got a bit lost there, I look at the solution to improve understanded.
    #
    #IO.puts Calcint.gcd(20, 15)   #=> 5
    #IO.puts Calcint.gcd(20, 16)   #=> 4
    #
    def gcd(x, 0), do: x
    def gcd(x, y), do: gcd(y, rem(x, y))
end