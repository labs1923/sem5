import sys
inf = sys.maxsize
def floyd(g,ki,kf):
    for k in range(len(g)):
        for i in range(len(g)):
            for j in range(len(g)):
                if (g[i][j]>g[i][k]+g[k][j]):
                    g[i][j] = g[i][k]+g[k][j]
                    ki[i][j] = k
    for i in range(len(g)):
        for j in range(len(g)):
            if(i>j):
                kf[i][j] = kf[j][i][::-1]
            else :
                if (ki[i][j] != -1):
                    r = j
                    while(ki[i][r] != -1):
                        kf[i][j].append(chr(65+ki[i][r]))
                        r = ki[i][r]
                kf[i][j] = kf[i][j][::-1]
    return g,kf
def generate_input():
    n = int(input("enter no of nodes : "))
    g = []
    k = []
    kf = []
    for i in range(n):
        l = list(map(int,input().split()))
        l = [i if i!=-1 else inf for i in l ]
        g.append(l)
    for i in range(n):
        l = []
        m = []
        for j in range(n):
            l.append(-1)
            m.append([])
        k.append(l)
        kf.append(m)
    return g,k,kf
g,k,kf = generate_input()
distances,nodes = floyd(g,k,kf)
while(1):
    s = ord(input("enter source node : "))-65
    d = ord(input("enter destination node : "))-65
    print("shortest distance between source and destination node : ",distances[s][d])
    print("path followed from source to destination is : ",[chr(s+65)]+nodes[s][d]+[chr(d+65)])
    c = int(input("Enter choice\n0.To Exit\n1.To continue \n2.To change input\n"))
    if(c==0):
     break
    elif(c==1) :
        continue
    else :
        g,k,kf = generate_input()
        distances,nodes = floyd(g,k,kf)



#sample input
# 5
# 0 5 2 3 -1
# 5 0 4 -1 3
# 2 4 0 -1 4
# 3 -1 -1 0 -1
# -1 3 4 -1 0


