import axios from 'axios';
import { SupportFormValues } from '../types/Forms';

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

export const sendUserEmail = async (email: string) => {
  try {
    const response = await axios.post(
      'http://localhost:5000/newslist/addemail',
      {
        email,
      }
    );

    return response.data;
  } catch (error: any) {
    console.error(error);
    const isError = error.response.status === 409 || 400;

    if (isError) {
      throw new Error(error.response.status);
    }

    throw new Error('Failed to send user message');
  }
};
