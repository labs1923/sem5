n=int(input("Enter No. of Blocks: "))
clear=[True]*(n+1)
on=[0]*(n+1)
goalOn=[0]*(n+1)

def putOn(x,y):
  if not clear[x]:
    putOnTable(on.index(x))
  if not clear[y]:
    putOnTable(on.index(y))
  clear[y]=False
  clear[on[x]]=True
  on[x]=y
  print("Put block",x,"on",y)    
    
  
def putOnTable(x):
  if not clear[x]:
    putOnTable(on.index(x))
  clear[on[x]]=True
  on[x]=0
  print("Put block",x,"on table")

print("Initial state: ")
print("Select position of each block: 1.On Table   2.On a Block")
for i in range(1,n+1):
  print("Block",i)
  pos=int(input())
  if pos==1:
    on[i]=0
  elif pos==2:
    y=int(input("On which block: "))
    clear[y]=False
    on[i]=y
for i in range(1,n+1):
  print(i,clear[i],on[i])
print("For Goal state: ")
print("Select position of each block: 1.On Table   2.On a Block")
for i in range(1,n+1):
  print("Block",i)
  pos=int(input())
  if pos==1:
    goalOn[i]=0
  elif pos==2:
    goalOn[i]=int(input("On which block: "))
#for i in range(1,n+1):
  #print(i,clear[i],on[i])
  
base=[]

if on!=goalOn:
  for i in range(1,n+1):
    if goalOn[i]==0:
      if on[i]!=0:
        putOnTable(i)
      base.append(i)
  while on!=goalOn:
    b=base.pop(0)
    try:
      x=goalOn.index(b)
      if on[x]!=b:
        putOn(x,b)
      base.append(x)
    except:
      pass
    
    
'''
6
2
2
2
4
2
5
2
6
1
1
1
2
3
1
2
6
2
2
1
'''
