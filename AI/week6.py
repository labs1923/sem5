matrix = [i for i in range(9)]
def availability(c):
    if matrix[c] == c :
        return True
    else :
        return False
def checkboard():
    for i in range(0,9,3):
        if(matrix[i]==matrix[i+1] and matrix[i+1]==matrix[i+2]):
            return 1
    for i in range(3):
        if(matrix[i]==matrix[i+3] and matrix[i+3]==matrix[i+6]):
            return 1
    if(matrix[0] == matrix[4] and matrix[4]==matrix[8]):
        return 1
    if(matrix[2]==matrix[4] and matrix[4]==matrix[6]):
        return 1
    for i in range(9):
        if matrix[i] == i:
            return 0
    return -1
def display():
    print("-------------")
    print("| ",end="")
    for i in range(9):
        if i%3 == 0 and i!=0:
            print()
            print("-------------")
            print("| ",end="")
        print(matrix[i],end=" | ")
    print()
    print("-------------")
c = 0
s1 = input("enter symbol of player 1 : ")
s2 = input("enter symbol of player 2 : ")
turn = 0 
display()
while(c!=9):
    choice = int(input("enter player "+str(turn+1)+" choice position : "))
    if(availability(choice)):
        matrix[choice] = s1 if turn ==0 else s2
        c += 1
        display()
        result = checkboard()
        if(result == 1):
            print("player "+str(turn+1)+" wins ")
            break
        elif result == -1:
            print("draw")
            break
        turn = (turn+1)%2
    else :
        print("Invalid Choice")
