import math
def check():
 if need>max(j1,j2):
   return "No"
 if need % math.gcd(j1,j2)==0:
   return "Yes"
 return "No"
j1,j2=map(int,input("Enter the capacity of Jug 1 and Jug 2: ").split())
need=int(input("Enter the capacity of water needed: "))
x, y=0, 0
if check()=="No":
 print("Problem can't be solved")
else:
 while x!=need and y!=need:
   if x==0:
     x=j1
   elif x>0 and y!=j2:
     while x!=0 and y!=j2:
       x,y=x-1,y+1
   elif x>0 and y==j2:
     y=0
   print("JUG1:",x,"JUG2:",y)
 if x==need:
   print("JUG1 Contains the needed quantity")
 else:
   print("JUG2 Contains the needed quantity")
