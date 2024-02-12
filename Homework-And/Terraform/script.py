import subprocess
import string
import random

username = input("username for mysql: ")
database_name = input("Insert your db name: ")
table_name = input("Your table name: ")

def generate_password(length=12):
    characters = string.ascii_letters + string.digits
    return ''.join(random.choice(characters) for i in range(length))

password = generate_password()

def install_mysql():
# Check if Mysql is already installed
    if not subprocess.run(["dpkg-query", "-l", "mysql-server"], capture_output=True, text=True).stdout:
        #Install Mysql
        subprocess.run(["sudo", "apt", "install", "-y", "mysql-server"])
        print("mysql is installed")
 # Start my SQL servise
        subprocess.run(["sudo", "systemctl", "start", "mysql"])
  #Check MySQL version
        subprocess.run(["mysql", "--version"])
    else:
        print("ho-ho")
        print("MySQL version is " + subprocess.run(["mysql", "--version"], capture_output=True, text=True).stdout)

def create_user():
    subprocess.run(["sudo", "mysql", "-u", "root", "-e", f"CREATE USER '{username}'@'localhost' IDENTIFIED BY '{password}';"])
    print(username)
    subprocess.run(["sudo", "mysql", "-u", "root", "-e", f"GRANT ALL PRIVILEGES ON *.* TO '{username}'@'localhost';"])
    subprocess.run(["sudo", "mysql", "-u", "root", "-e", "FLUSH PRIVILEGES;"])
    print("this is my pass "+ password)



def db_up():
    try:
        conn = mysql.connector.connect(user=username, password=password, host="localhost")
    except mysql.connector.Error as err:
        print("Try to connect MySQL . Wait 5 second ...")
        time.sleep(5)

install_mysql()
create_user()

conn = ""
db_up()

cursor = conn.cursor()
cursor.execute(f"CREATE DATABASE {database_name}")
cursor.execute(f"USE {database_name}")
cursor.execute(f"""CREATE TABLE {table_name}(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
    age INT
    email VARCHAR(255)
    );""")
conn.commit()
cursor.close()
conn.close()


print(f"DB '{database_name}' create successfully")
print(f"Table '{database_table}' is created")

db_up()
#install_mysql()
#create_user()
