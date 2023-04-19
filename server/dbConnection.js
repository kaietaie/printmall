import "dotenv/config";
import * as fs from 'fs';
import pg from 'pg';
const { Pool } = pg;


export const pool = new Pool({
    host: "db-postgresql-fra1-12589-do-user-2461444-0.b.db.ondigitalocean.com",
    port: 25060,
    database: "marketplacedb",
    user: "printmall",
    password: "AVNS_3ORLC-3g-TlE-C8IgLR",
    ssl: {
      rejectUnauthorized: false,
      cert: fs.readFileSync("./ca-certificate.crt").toString(),
    },
  });
