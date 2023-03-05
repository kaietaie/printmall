import express from "express";
import cors from "cors";
import "dotenv/config";
import cookieParser from "cookie-parser";
import corsConfig from "./CORS/corsConfig";
import credentials from './middleware/credentials';
import { blogRouter } from "./routes/blog.route";
import { productRouter } from "./routes/product.route";
import { sellerRouter } from "./routes/seller.route";
import fileUpload from "express-fileupload";

const host = process.env.HOST || "localhost";
const port = process.env.SERVER_PORT || 5000;
const app = express();

// Handle options credentials check - before CORS!
// and fetch cookies credentials requirement
app.use(credentials);

// Cross Origin Resource Sharing
app.use(cors(corsConfig));
// built-in middleware to handle urlencoded form data
app.use(express.urlencoded({extended: false}));
app.use(cookieParser());
app.use(express.json());
// enable files upload
app.use(fileUpload({
  createParentPath: true
}));

app.use('/blog', blogRouter); 
app.use('/products', productRouter);
app.use('/seller', sellerRouter);
// app.use('/auth', );
// app.use('/refresh', );
// app.use('/logout',  );
// app.use('/order',  );

app.listen(port, () => {
  console.log(`Server is working on ${host}:${port}`);
});
