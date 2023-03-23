import express from "express";
import cors from "cors";
import "dotenv/config";
import cookieParser from "cookie-parser";
import corsConfig from "./CORS/corsConfig.js";
import credentials from './middleware/credentials.js';
import { blogRouter } from "./routes/blog.route.js";
import { productRouter } from "./routes/product.route.js";
import { sellerRouter } from "./routes/seller.route.js";
import fileUpload from "express-fileupload";
import { paymentRouter } from "./routes/payment.route.js";
import { newslistRouter } from "./routes/newslist.route.js";

const host = process.env.HOST || "localhost";
const port = process.env.SERVER_PORT || 5000;
const app = express();

// Handle options credentials check - before CORS!
// and fetch cookies credentials requirement
app.use(credentials);

// Cross Origin Resource Sharing
app.use(cors(corsConfig));
// built-in middleware to handle urlencoded form data
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.json());
// enable files upload
app.use(fileUpload({
  createParentPath: true 
}));
app.use('/public',express.static('public'));
app.use('/newslist', newslistRouter);
app.use('/blog', blogRouter);
app.use('/products', productRouter);
app.use('/seller', sellerRouter);
app.use('/payment', paymentRouter);
// app.use('/auth', );
// app.use('/refresh', );
// app.use('/logout',  );
// app.use('/order',  );

app.listen(port, () => {
  console.log(`Server is working on ${host}:${port}`);
});
