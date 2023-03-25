import axios from 'axios';
import { SupportFormValues } from '../types/Support';

export const sendUserMessage = async (userMessage: SupportFormValues) => {
  try {
    const response = await axios.post('http://localhost:5000/contactus/send', {
      user_message: userMessage,
    });

    return response.data;
  } catch (error) {
    console.error(error);
    throw new Error('Failed to send user message');
  }
};
