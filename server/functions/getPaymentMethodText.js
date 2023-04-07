export default function getPaymentMethodText(key) {
  const paymentMethods = {
    pan: `Credit Card`,
    apple: `Apple pay`,
    google: `Google pay`,
    monobank: `Monobank`,
    monopay: `Monopay`,
  };
  return paymentMethods[key] || "PayPal";
}
