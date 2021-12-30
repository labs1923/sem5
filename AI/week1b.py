def addition(a,b):
      return a+b
def subtraction(a,b):
  return a-b
def multiply(a,b):
  return a*b
def division(a,b):
  return a/b
print("1. Addition\n2. Subtraction\n3. Multiplication\n4. Division")
a=int(input("enter first number: "))
b=int(input("enter second number: "))
ch=int(input("enter the choice: "))
if ch==1:
  print("The addition of two numbers is: ",addition(a,b))
elif ch==2:
  print("The subtraction of two numbers is: ",subtraction(a,b))
elif ch==3:
  print("The product of two numbers is: ",multiply(a,b))
elif ch==4:
  print("The division of two numbers is: ",division(a,b))
else:
  print("Exit")
