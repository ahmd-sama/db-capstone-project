import mysql.connector as connector

# Connect to the Little Lemon database
connection = connector.connect(
    host="localhost",
    user="capstone_user",
    password="Ahmed@2026",
    database="littlelemondb"
)

# Create a cursor
cursor = connection.cursor()

# =========================
# Task 2: Show all tables
# =========================
show_tables_query = "SHOW TABLES"
cursor.execute(show_tables_query)

results = cursor.fetchall()

print("Tables in the database:")
for table in results:
    print(table)

print("\n==============================\n")

# =========================
# Task 3: Customers with orders greater than $60
# =========================
query = """
SELECT
    Customers.FullName,
    Customers.ContactNumber,
    Customers.Email,
    Orders.TotalCost
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.TotalCost > 60;
"""

cursor.execute(query)

results = cursor.fetchall()

print("Customers with orders greater than $60:\n")

for row in results:
    print(row)

# Close connection
cursor.close()
connection.close()