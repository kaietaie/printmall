import "dotenv/config";
import * as fs from 'fs';
import pg from 'pg';
const { Pool } = pg;


export const pool = new Pool({
    host: process.env.PGHOST,
    port: process.env.PGPORT,
    database: process.env.PGDATABASE,
    user: process.env.PGUSER,
    password: process.env.PGPASSWORD,
    ssl: {
      rejectUnauthorized: false,
      cert: fs.readFileSync("./ca-certificate.crt").toString(),
    },
  });
