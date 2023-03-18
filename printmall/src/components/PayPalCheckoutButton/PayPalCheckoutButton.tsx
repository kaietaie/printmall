// eslint-disable-next-line @typescript-eslint/ban-ts-comment
// @ts-nocheck
import React, { useState } from 'react';
import ReactDOM from 'react-dom';
import { PayPalButtons } from '@paypal/react-paypal-js';
// const PayPalButton = paypal.Buttons.driver('react', {
//   React: window.React,
//   ReactDOM: window.ReactDOM,
// });

interface Producto {
  price: number;
  sku: string
}

export default function PayPalCheckoutButton(product: Producto) {
    console.log(product.product.sku)
  const createOrder = (data: any) => {
    // Order is created on the server and the order id is returned
    return fetch('http://localhost:5000/payment/create-paypal-order', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      // use the "body" param to optionally pass additional order information
      // like product skus and quantities
      body: JSON.stringify({
        cart: {
          quantity: '2',
          sku: product.product.sku,
        },
      }),
    })
      .then((response) => response.json())
      .then((order) => order.id);
  };
  const onApprove = (data: any) => {
    // Order is captured on the server and the response is returned to the browser
    return fetch('http://localhost:5000/payment/capture-paypal-order', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        orderID: data.orderID,
      }),
    }).then((response) => response.json());
  };
  return (
    <PayPalButtons
      createOrder={(data: any) => createOrder(data)}
      onApprove={(data: any) => onApprove(data)}
    />
  );
}
//
// import { PayPalButtons } from '@paypal/react-paypal-js';
//
// const PayPalCheckoutButton = (props: any) => {
//   const { product } = props;
//
//   const [paidFor, setPaidFor] = useState(false);
//   const [error, setError] = useState('');
//
//   const handleApprove = (orderID: string) => {
//     //call backend function to fulfill order
//     setPaidFor(true);
//     //refresh user`s account or subscription status
//
//     //if response returns error
//     // setError('Your payment was processed successfully. However, we are unable to fulfill your purchase. Please contact us at mail@mail for assistance')
//   };
//
//   if (paidFor) {
//     //display success message
//     alert('Thanks for purchase');
//   }
//
//   if (error) {
//     //display error message
//     alert(error);
//   }
//   return (
//     <PayPalButtons
//       style={{
//         color: 'blue',
//         // layout: 'horizontal',
//         height: 55,
//         // tagline: true,
//         shape: 'pill',
//       }}
//       onClick={(data, actions) => {
//         //validate on button click on client or server side
//         const hasAlreadyBoughtProduct = false;
//
//         if (hasAlreadyBoughtProduct) {
//           setError('You already bought this product');
//           return actions.reject();
//         } else {
//           return actions.resolve();
//         }
//       }}
//       createOrder={(data, actions) => {
//         return actions.order.create({
//           purchase_units: [
//             {
//               description: product.description,
//               amount: {
//                 value: product.price,
//               },
//             },
//           ],
//         });
//       }}
//       onApprove={async (data, actions) => {
//         const order = await actions.order?.capture();
//         console.log(order);
//
//         handleApprove(data.orderID);
//       }}
//       onCancel={() => {
//         //Display cancel massage or redirect to cart
//       }}
//       onError={(err) => {
//         // eslint-disable-next-line @typescript-eslint/ban-ts-comment
//         // @ts-ignore
//         setError(err);
//         console.error('PayPal Checkout onError', err);
//       }}
//     />
//   );
// };
//
// export default PayPalCheckoutButton;
