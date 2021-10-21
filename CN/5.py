def rgen(n,cl):
    numbers = []
    for i in range(cl):
      binary = bin(i).replace("0b", "")
      while(len(binary)<n):
        binary = str(0)+binary
      numbers.append(list(binary)[::-1])
    r = list()
    for i in range(n):
        rn = list()
        for j in range(cl):
            if numbers[j][i] == '1':
                rn.append(j)
        r.append(rn)
    return r
def even_parity(p,m):
    even = 0
    for i in range(1,len(p)):
       if(m[p[i]-1]=='1'):
           even += 1
    if even%2 == 0:
       return '0'
    else :
       return '1'
message = list(input())
message_rev = message[::-1]
message_len  = len(message)
hc = list()
power = 0
index = 0
i = 1
while(index<message_len):
    if(pow(2,power) == i):
        power += 1
        hc.append('r'+str(power))
    else :
        hc.append(message_rev[index])
        index += 1
    i+=1
r = rgen(power,len(hc)+1)
two_pow = 0
for i in range(len(r)):
    hc[pow(2,two_pow)-1] = even_parity(r[i],hc)
    two_pow += 1
print("hamming code generated :- ")
print("".join(hc)) 