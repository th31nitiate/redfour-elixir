#Pattern match 1

a = [1, 2, 3] #1,2,3
a = 4 # 4 
4 = a # 4 = true
[a, b] = [ 1, 2, 3 ] # This wont, can assign to an in
a = [ [ 1, 2, 3 ] ] #A will equal list 1,2,3
[a] = [ [ 1, 2, 3 ] ]# key work list 1,2,3
[[a]] = [ [ 1, 2, 3 ] ]#No match

#Pattern match 2

[ a, b, a ] = [ 1, 2, 3 ] # fails because a matchs 1 & 3 wont match
[ a, b, a ] = [ 1, 1, 2 ] # fails also because a = 1
[ a, b, a ] = [ 1, 2, 1 ] # this will match sucess since a = 1. 

#Pattern match 3
[ a, b, a ] = [ 1, 2, 3 ] # fails, since match is invalid even if a = 2
[ a, b, a ] = [ 1, 1, 2 ] # fails, since match is invalid even if a = 2
a = 1 # changes a to 1 since we assigning the value
^a = 2 # since we are using the ^ value it wont reassign but instead use the initial preset value
^a = 1 # this will be true, since the value is one
^a = 2 - a # This is true & since 2 - 1 = 1