import socket
import time

def server_program():
    host = socket.gethostname()
    port = 5000  

    server_socket = socket.socket() 
    
    server_socket.bind((host, port)) 
    server_socket.listen(2)
    conn, address = server_socket.accept() 
    print("Connection from: " + str(address))
    c = 1
    while True:
        data = conn.recv(1024).decode()
        if not data:
            break
        if c%4 == 0 :
            c += 1
            time.sleep(2)
            data = "Not Received"
            conn.send(data.encode())  
            continue
        print("Recieved data "+str(data))
        data = "Data recieved : "+str(data)
        conn.send(data.encode())  
        c += 1
    conn.close()  


if __name__ == '__main__':
    server_program()