# created a new package named pack1 and made module m1 under it with method f1
# now using the package here 
from pack1.m1 import * 
f1()

# created a new subpackage named subpack1 under pack1 and made module m2 with method f2
# now using the package here 
from pack1.subpack1.m2 import *
f2()