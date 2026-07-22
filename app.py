import mariadb
import secret

db_config = {
    'host': 'localhost',
    'port': 3306,
    'user': secret.username,
    'password': secret.password,
    'database': 'dbfp_library'
}

if __name__ == "__main__":
    conn = None
    cursor = None
    # TODO connection function
    try: 
        print("Connecting to Mariadb")
        conn = mariadb.connect(**db_config) # TODO what is **? unpack?
        print("Connection successful!")
        cursor = conn.cursor()
    except:
        print("Error") # TODO how to print error message 
    if cursor:
        query = "SELECT * FROM staff"
        cursor.execute(query)
        for row in cursor:
            print(f"ID: {row[0]}\t\tname: {row[1]}\t\tdob: {row[2]}\nposition: {row[3]}\t\tsalary: {row[4]}\t\temail: {row[5]}\nphone: {row[6]}\t\tstreet: {row[7]}\t\tcity: {row[8]}\t\tzip: {row[9]}\n\n")
    

    