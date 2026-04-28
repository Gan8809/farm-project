# Farm Management System Backend Boilerplate

This repository contains a boilerplate for a Farm Management System backend using Node.js, Express, and PostgreSQL.

## Table of Contents
1. [Getting Started](#getting-started)
2. [Folder Structure](#folder-structure)
3. [Setup Guide](#setup-guide)
4. [Database Schema](#database-schema)
5. [API Endpoints](#api-endpoints)
6. [Dependencies](#dependencies)

## Getting Started

### Prerequisites
- Node.js
- PostgreSQL
- npm

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/Gan8809/farm-project.git
   cd farm-project
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Create the two databases:
   ```sql
   CREATE DATABASE farm_management;
   CREATE DATABASE users;
   ```

### Configuration
1. Rename `.env.example` to `.env` and fill in the required environment variables.
2. Run the database migrations:
   ```bash
   psql -U <username> -d farm_management -f db/schema.sql
   ```

3. Start the server:
   ```bash
   npm start
   ```

## Folder Structure
```
backend/
└── src/
    ├── controllers/
    │   ├── farmController.js
    │   ├── recordController.js
    ├── db/
    │   └── index.js
    ├── middleware/
    │   ├── authMiddleware.js
    ├── models/
    │   ├── user.js
    │   ├── farm.js
    │   └── record.js
    └── routes/
        ├── farmRoutes.js
        └── recordRoutes.js
``` 

## Setup Guide
Follow the instructions in the 'Getting Started' section to set up your development environment.

## Database Schema
The database schema is defined in `db/schema.sql` and implements the following tables:
- **users**: Stores user information.
- **farms**: Contains information related to various farms.
- **farm_records**: Keeps track of purchase, selling, pesticide control, chemical control, and fertilizer control records.

### Example of database schema:
```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);
CREATE TABLE farms (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    farm_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);
CREATE TABLE farm_records (
    id SERIAL PRIMARY KEY,
    farm_id INTEGER REFERENCES farms(id),
    record_type VARCHAR(50) NOT NULL,
    details TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);
``` 

## API Endpoints
TBD

## Dependencies
- express
- pg
- jsonwebtoken
- dotenv
- bcrypt

## Example .env file
```env
DATABASE_URL=postgres://username:password@localhost:5432/farm_management
JWT_SECRET=mysecretkey
PORT=3000
```