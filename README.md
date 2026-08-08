# Little Lemon Database

## Overview

A relational database designed for the Little Lemon restaurant to manage customers, bookings, menu information, staff, orders, and order delivery status.

The database was designed using MySQL Workbench and implemented using MySQL.

## Database Features

- Customer information management
- Table booking management
- Menu and cuisine information
- Staff information and roles
- Order management
- Order delivery status tracking
- Relationships between customers, bookings, orders, staff, and menu records

## Database Structure

The database contains the following tables:

- `Customers` – Stores customer names and contact information.
- `Bookings` – Stores restaurant bookings and their associated customers.
- `Menu` – Stores cuisine and menu item information.
- `Staff` – Stores staff names, roles, and salaries.
- `Orders` – Stores order dates, quantities, costs, and related customer, menu, and staff information.
- `OrderDeliveryStatus` – Tracks delivery dates and order delivery statuses.

## Technologies

- MySQL
- MySQL Workbench
- SQL

## Project Files

- `LittleLemonDB.sql` – SQL script used to create the database and its tables.
- `LittleLemonDM.mwb` – MySQL Workbench database model.
- `LittleLemonDM.png` – Visual representation of the database model.

## Database Relationships

The database uses foreign keys to connect related entities:

- Customers → Bookings
- Customers → Orders
- Menu → Orders
- Staff → Orders
- Orders → OrderDeliveryStatus

These relationships help maintain data consistency across the database.

## Setup

1. Open MySQL Workbench.
2. Open the `LittleLemonDB.sql` file.
3. Execute the SQL script.
4. The `LittleLemonDB` schema and its tables will be created.
5. Use the database for queries and further development.

## Author

Ahmed Osama AbdelKareem