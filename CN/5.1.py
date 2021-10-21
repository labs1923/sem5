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
        # print(r[i]) 
    return r
def even_parity(p,m):
    even = 0
    for i in range(len(p)):
       if(m[p[i]-1]=='1'):
           even += 1
    if even%2 == 0:
       return '0'
    else :
       return '1'
message = input()
power = 0
for i in range(len(message)):
    if(pow(2,power)<i):
        power += 1
message_len = len(message)
p = rgen(power,message_len+1)
p_bits = []
for i in range(power):
    p_bits.append(even_parity(p[i],message))
p_no = 0
for i in range(power):
    p_no += int(p_bits[i])*pow(2,i)
print("parity bit is :- ",p_no)
if message[p_no] == 1:
    message = message[:p_no-1]  +str(0) + message[p_no:]  
else :
   message = message[:p_no-1]  +str(1) + message[p_no:]  
print("corrected code :- ",message)