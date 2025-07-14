// Import the database connection pool we created in lib/db.js
// This lets us run SQL queries using the PostgreSQL client
import pool from '@/lib/db';

// Import Next.js's built-in response object for API routes
// 'NextResponse' helps us send JSON responses in a standard way
import { NextResponse } from 'next/server';

// Define the GET request handler for the route /api/test-db
export async function GET() {
  try {
    // Run a simple SQL query to get the current timestamp from the database
    // 'SELECT NOW()' returns the current date and time from the DB server
    const res = await pool.query('SELECT NOW();');

    // Return a JSON response with the success flag and the time returned from the DB
    // res.rows is an array of rows; [0] means the first row; .now is the column returned by the query
    return NextResponse.json({
      success: true,           // Indicates query was successful
      time: res.rows[0].now,   // Return the timestamp from the DB
    });
  } catch (err) {
    // If something goes wrong, catch the error and log it to the console
    console.error('[DB TEST ERROR]', err.message);

    // Respond with a 500 (Internal Server Error) and include the error message
    return NextResponse.json(
      {
        success: false,          // Indicates something failed
        error: err.message,      // Send back the error message for debugging
      },
      { status: 500 }            // HTTP status code 500: server error
    );
  }
}