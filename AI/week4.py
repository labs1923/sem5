n = int(input('Enter number of nodes : '))
heuristic = [0]+list(map(int,input("Enter Heuristic values : ").split()))
cost = [0]
path = []
for x in range(n):
  cost.append([0]+list(map(int,input().split())))
src = int(input('Enter the Source : '))
des = int(input('Enter the destination : '))
current = src
sum = 0
while(current != des):
  min = 9999
  minval = 0
  for i in range(1,n+1):
    x = heuristic[i] + cost[current][i]
    if x<min and i not in path:
      min = x
      minval = i
  sum += min
  path.append(current)
  current = minval
path.append(des)
print(path)
