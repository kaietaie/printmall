export default function getPaymentMethodText(key) {
  const paymentMethods = {
    pan: `Credit Cart`,
    apple: `Apple pay`,
    google: `Google pay`,
    monobank: `Monobank`,
    monopay: `Monopay`,
  };
  return paymentMethods[key] || "PayPal";
}
