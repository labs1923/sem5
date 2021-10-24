import socket
def client_program():
    host = socket.gethostname()  
    port = 5000 

    client_socket = socket.socket() 
    client_socket.connect((host, port))  
    n = int(input("no of packets : "))
    input_data = "enter packet of data : "
    c=0
    while(c<n):
        datapacket = input(input_data)  
        client_socket.send(datapacket.encode())
        acknowledgement = client_socket.recv(1024).decode()
        if(acknowledgement == "Not Received") :
            input_data = "Data not receieved resend the previous data : "
            
        else:
           input_data = "enter packet of data : "
           print(acknowledgement)
           c += 1
    

    client_socket.close() 


if __name__ == '__main__':
    client_program()