# import m1 # importing m1 from m2
# print(m1.a) #display the var of m1 from m2
# print(m1.mul(5,20)) #call method of m1 using m2

#module name aliasing
# import m1 as mod1 # importing m1 from m2 but as mod1
# print(mod1.a) #display the var of m1 from m2
# print(mod1.mul(5,20)) #call method of m1 using m2

# to directly import components of a module 
# from m1 import a,mul # importing a and mul from m1 directly
# print(a) #display the var of m1 from m2
# print(mul(5,20)) #call method of m1 using m2

# To import all the components of a module 
# from m1 import * # importing all from m1 directly
# print(a) #display the var of m1 from m2
# print(mul(5,20)) #call method of m1 using m2

# to alias the name of components of a module 
# from m1 import a as b,mul as m # importing a and mul from m1 directly but with alias name
# print(b) #display the var of m1 from m2 but using alias name
# print(m(5,20)) #call method of m1 using m2 but using alias name

# We can import from multiple modules as well 
# we can create object of a class of other module
from m3 import test #import class from m3
t=test() #created obj of test class
t.display() #call the method of m3


