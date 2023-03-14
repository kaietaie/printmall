CREATE TABLE "product_type" (
  "id" serial PRIMARY KEY,
  "name" varchar,
  "color" int,
  "size_id" int,
  "quantity" int,
  "available_print_ids" array,
  "created_at" datetime,
  "updated_at" datetime,
  "deleted_at" datetime DEFAULT null
);

CREATE TABLE "sizes" (
  "id" serial PRIMARY KEY,
  "size" varchar
);

CREATE TABLE "print" (
  "id" serial PRIMARY KEY,
  "name" varchar,
  "color" varchar,
  "created_at" datetime,
  "updated_at" datetime,
  "deleted_at" datetime DEFAULT null
);

CREATE TABLE "product_image" (
  "id" serial PRIMARY KEY,
  "product_type_id" int,
  "print_id" int,
  "image" file,
  "created_at" datetime,
  "updated_at" datetime,
  "deleted_at" datetime DEFAULT null
);

CREATE TABLE "product" (
  "id" serial PRIMARY KEY,
  "sku" int,
  "product_type_id" int,
  "product_type_colors" array,
  "print_id" int,
  "name" varchar,
  "description" varchar,
  "product_type_size" varchar,
  "product_type_quantity" int,
  "product_image_id" int,
  "price" float,
  "price_currency" varchar,
  "seller_id" int
);

CREATE TABLE "cart_product" (
  "user_cart_id" int,
  "product_id" int
);

CREATE TABLE "user_cart" (
  "id" serial PRIMARY KEY,
  "user_session_id" uuid
);

CREATE TABLE "colors" (
  "id" serial PRIMARY KEY,
  "color" varchar,
  "color_image" file
);

CREATE TABLE "sellers" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "order" (
  "id" serial PRIMARY KEY,
  "shipping_info_id" int,
  "payment_id" int,
  "finalaized" boolean,
  "email_sent" boolean,
  "shipped" boolean,
  "delivered" boolean
);

CREATE TABLE "payment" (
  "id" serial PRIMARY KEY,
  "user_cart_id" int,
  "transaction_number" int,
  "confirmation_number" int,
  "orginal_price_amount" float,
  "paid_price_amount" float,
  "paid_price_currency" varchar
);

CREATE TABLE "shipping_info" (
  "id" serial PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "phone" varchar,
  "email" varchar,
  "address_line_1" varchar,
  "address_line_2" varchar,
  "city" varchar,
  "country" varchar,
  "state" varchar,
  "zip_code" int
);

CREATE TABLE "order_lines" (
  "order_id" int,
  "product_id" int,
  "item_type" int,
  "price" float,
  "quantity" int,
  "sub_total" float,
  "tax" float,
  "total" float
);

ALTER TABLE "sizes" ADD FOREIGN KEY ("id") REFERENCES "product_type" ("size_id");

ALTER TABLE "product" ADD FOREIGN KEY ("id") REFERENCES "order_lines" ("product_id");

ALTER TABLE "order" ADD FOREIGN KEY ("id") REFERENCES "order_lines" ("order_id");

ALTER TABLE "payment" ADD FOREIGN KEY ("id") REFERENCES "order" ("payment_id");

ALTER TABLE "shipping_info" ADD FOREIGN KEY ("id") REFERENCES "order" ("shipping_info_id");

ALTER TABLE "sellers" ADD FOREIGN KEY ("id") REFERENCES "product" ("seller_id");

ALTER TABLE "product_image" ADD FOREIGN KEY ("id") REFERENCES "product" ("product_image_id");

ALTER TABLE "product_type" ADD FOREIGN KEY ("id") REFERENCES "product" ("product_type_id");

ALTER TABLE "print" ADD FOREIGN KEY ("id") REFERENCES "product" ("print_id");

ALTER TABLE "product_type" ADD FOREIGN KEY ("size_id") REFERENCES "product" ("product_type_size");

ALTER TABLE "product_type" ADD FOREIGN KEY ("quantity") REFERENCES "product" ("product_type_quantity");

ALTER TABLE "product_type" ADD FOREIGN KEY ("id") REFERENCES "product_image" ("product_type_id");

ALTER TABLE "print" ADD FOREIGN KEY ("id") REFERENCES "product_image" ("print_id");

ALTER TABLE "colors" ADD FOREIGN KEY ("id") REFERENCES "product_type" ("color");

ALTER TABLE "product" ADD FOREIGN KEY ("id") REFERENCES "cart_product" ("product_id");

ALTER TABLE "user_cart" ADD FOREIGN KEY ("id") REFERENCES "cart_product" ("user_cart_id");
