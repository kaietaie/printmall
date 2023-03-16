
export default async function checkout (req, res) {
  res.render("index", {
    PAYPAL_CLIENT_ID: process.env.PAYPAL_CLIENT_ID,
  });
    }