import { useState } from 'react';
import { PayPalButtons } from '@paypal/react-paypal-js';
import { SkuCartItem } from '../../types/Cart';
import { useDispatch, useSelector } from 'react-redux';
import { AppDispatch, RootState } from '../../store/store';
import { selectPayPalCartItems } from '../../store/cart/cartSelectors';
import axios from 'axios';
import { clearCart } from '../../store/cart/cartSlice';
import { useNavigate } from 'react-router-dom';
// const PayPalButton = paypal.Buttons.driver('react', {
//   React: window.React,
//   ReactDOM: window.ReactDOM,
// });

const PayPalCheckoutButton = () => {
  const dispatch = useDispatch<AppDispatch>();
  const navigate = useNavigate();
  const [paidFor, setPaidFor] = useState(false);
  const skuCartItems = useSelector<RootState, SkuCartItem[]>(
    selectPayPalCartItems
  );

  const createOrder = async (data: any) => {
    // Order is created on the server and the order id is returned
    try {
      const response = await axios.post(
        'http://localhost:5000/payment/create-paypal-order',
        {
          cart: skuCartItems,
        }
      );

      return response.data.id;
    } catch (error) {
      console.error(error);
      throw new Error('Failed to create PayPal order');
    }
  };

  const handleApprove = async (data: any) => {
    try {
      const response = await axios.post(
        'http://localhost:5000/payment/capture-paypal-order',
        {
          orderID: data.orderID,
        }
      );

      if (response.data.status === 'COMPLETED') {
        dispatch(clearCart());
        setPaidFor(true);
      }

      return response.data;
    } catch (error) {
      console.error(error);
    }
  };

  if (paidFor) {
    navigate('/complete');
  }

  return (
    <PayPalButtons
      createOrder={(data: any) => createOrder(data)}
      onApprove={(data: any) => handleApprove(data)}
    />
  );
};

export default PayPalCheckoutButton;
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
