const emailValidation =  user_email => {
    const validRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return user_email.toLowerCase().trim().match(validRegex)
}

export default emailValidation