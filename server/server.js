import express from "express";
import cors from "cors";
import "dotenv/config";
import cookieParser from "cookie-parser";
import corsConfig from "./CORS/corsConfig.js";
import credentials from './middleware/credentials.js';
import { blogRouter } from "./routes/blog.route.js";
import { productRouter } from "./routes/product.route.js";
import { sellerRouter } from "./routes/seller.route.js";
import { paymentRouter } from "./routes/payment.route.js";
import { paymentmonoRouter } from "./routes/paymentmono.route.js";
import { newslistRouter } from "./routes/newslist.route.js";
import { contactRouter } from "./routes/contact.route.js";
import { shippingRouter } from "./routes/shipping.route.js";
import { ordersRouter } from "./routes/orders.route.js";

const host = process.env.HOST;
const port = process.env.SERVER_PORT;
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


 
app.use('/public',express.static('public'));
app.use('/newslist', newslistRouter);
app.use('/blog', blogRouter);
app.use('/products', productRouter);
app.use('/seller', sellerRouter);
app.use('/payment', paymentRouter);
app.use('/paymentmono', paymentmonoRouter);
app.use('/contactus', contactRouter);
app.use('/shipping', shippingRouter);
app.use('/orders', ordersRouter);
// app.use('/auth', );
// app.use('/refresh', );
// app.use('/logout',  );
// app.use('/order',  );

app.listen(port, () => {
  console.log(`Server is working on ${host}:${port}`);
});
