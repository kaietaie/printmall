"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const cors_1 = __importDefault(require("cors"));
require("dotenv/config");
const cookie_parser_1 = __importDefault(require("cookie-parser"));
const corsConfig_1 = __importDefault(require("./CORS/corsConfig"));
const credentials_1 = __importDefault(require("./middleware/credentials"));
const blog_route_1 = require("./routes/blog.route");
const product_route_1 = require("./routes/product.route");
const seller_route_1 = require("./routes/seller.route");
const express_fileupload_1 = __importDefault(require("express-fileupload"));
const host = process.env.HOST || "localhost";
const port = process.env.SERVER_PORT || 5000;
const app = (0, express_1.default)();
// Handle options credentials check - before CORS!
// and fetch cookies credentials requirement
app.use(credentials_1.default);
// Cross Origin Resource Sharing
app.use((0, cors_1.default)(corsConfig_1.default));
// built-in middleware to handle urlencoded form data
app.use(express_1.default.urlencoded({ extended: false }));
app.use((0, cookie_parser_1.default)());
app.use(express_1.default.json());
// enable files upload
app.use((0, express_fileupload_1.default)({
    createParentPath: true
}));
app.use('/public', express_1.default.static('public'));
app.use('/blog', blog_route_1.blogRouter);
app.use('/products', product_route_1.productRouter);
app.use('/seller', seller_route_1.sellerRouter);
// app.use('/auth', );
// app.use('/refresh', );
// app.use('/logout',  );
// app.use('/order',  );
app.listen(port, () => {
    console.log(`Server is working on ${host}:${port}`);
});
//# sourceMappingURL=server.js.map