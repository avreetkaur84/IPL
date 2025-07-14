// Import the entire 'pg' (PostgreSQL) package.
// In Next.js and other ESM environments, we import the whole module as 'pkg'.
import pkg from 'pg';

// Destructure the 'Pool' class from the 'pg' package.
// 'Pool' allows us to manage multiple DB connections efficiently.
const { Pool } = pkg;

// Create a new instance of the Pool class.
// We're using environment variables to securely provide DB credentials.
const pool = new Pool({
  user: process.env.DB_USER,         
  password: process.env.DB_PASSWORD, 
  host: process.env.DB_HOST,         
  port: process.env.DB_PORT,         
  database: process.env.DB_NAME,     
});

// Export the pool instance so it can be reused in other parts of the project.
// This prevents creating new connections every time we access the DB.
export default pool;
