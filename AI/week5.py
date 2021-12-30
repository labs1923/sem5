import math
from itertools import permutations
def fun(a):
 sum1=0
 p=0
 for x in a[::-1]:
   sum1+=d[x]*int(math.pow(10,p))
   p+=1
 return sum1
a=input("Enter the 1st String: ")
b=input("Enter the 2nd String: ")
res=input("Enter result: ")
d={}
for x in a+b+res:
 if x not in d.keys():
   d[x]=0
p = permutations([0,1,2,3,4,5,6,7,8,9],len(d))
for i in list(p):
 index=0
 for x in d.keys():
   d[x]=i[index]
   index+=1
 x,y,z=fun(a),fun(b),fun(res)
 if x+y==z:
   print(x,y,z)
