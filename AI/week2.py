clean = 0
dirt = 1
a = 0
b = 0
def testing(loc,s,cost):
   if(s==dirt):
     print("Room "+loc+" is dirty")
     cost += 1
     s = clean
     print("Room "+loc+" is Cleaned by vaccum cleaner")
   else :
     print("Room "+loc+" is already Clean")
   return s,cost
   
global cost 
cost = 0
loc = input("Enter Location : ")
a = int(input("Enter status of Room A : "))
b = int(input("Enter status of Room B : "))
if loc is 'A':
  print("Current room A")
  a,cost = testing(loc,a,cost)
  loc = 'B'
  if b==dirt:
    print("Moving to room B")
    cost += 1
    b,cost = testing(loc,b,cost)
  else:
    print("Room "+loc+" is clean")
else :
  b,cost = testing(loc,b,cost)
  print("Current room B")
  loc = 'A'
  if a==1:
    print("Moving to room A")
    cost += 1
    a,cost = testing(loc,a,cost)
  else:
    print("Room "+loc+" is clean")
if a==0 and b==0 :
  print("Room A and B are clean and cost of cleaning is ",cost)
