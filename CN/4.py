def xor(a,b):
    c = []
    for i in range(len(a)):
        if(a[i]==b[i]):
            c.append('0')
        else :
            c.append('1')
    return c
divisor = list(input())
dividend = list(input())
crc = dividend.copy()
divisor_len  = len(divisor)
dividend += ['0']*(divisor_len-1)
q = []
dividend_len = len(dividend)
for i in range(divisor_len,dividend_len+1):
    if(dividend[0] == '1'):
       c = xor(dividend[0:divisor_len],divisor)
       for i in range(divisor_len):
           dividend[i] = c[i]
       dividend.pop(0)
       q.append('1')
    else :
        dividend.pop(0)
        q.append('0')
crc = crc+dividend
crcb = "".join(crc)
print("crc : ",crcb)
crc_len = len(crcb)
for i in range(divisor_len,crc_len+1):
    if(crc[0] == '1'):
       c = xor(crc[0:divisor_len],divisor)
       for i in range(divisor_len):
           crc[i] = c[i]
           crc[i] = c[i]
       crc.pop(0)
    else :
        crc.pop(0)
r = "".join(crc)
print("remainder when crc is divided with divisor ",r)


# 1011
# 10110110