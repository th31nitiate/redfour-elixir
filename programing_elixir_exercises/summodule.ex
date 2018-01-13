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



    # module and funcations 6
    #Again this one was a bit beyound me. I wasnt too sure as to the ojective. 
    #I am not sure what the _ infront means. maybe it denoting private methods.
    #I think what is confusing here is the gussing process.


    def guess(actual, range = low..high) do 
        guess = div(low+high, 2)
        IO.puts "Is it #{guess}?"
        _guess(actual, guess, range)
    end
    
    defp _guess(actual, actual, _), 
        do: IO.puts "Yes, it's #{actual}"
    
    defp _guess(actual, guess,  _low..high)
        when guess < actual,
        do: guess(actual, guess+1..high) #the secret is happing here i guess
    
    defp _guess(actual, guess,  low.._high) 
        when guess > actual, 
        do: guess(actual, low..guess-1) #This is some type of recursion that basicly checks range based on the guard clause value
        #This will basically check all values present based on less or nmore than acuatal value.
end