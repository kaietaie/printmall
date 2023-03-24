import nodemailer from "nodemailer";

export default async function mailSend(data) {
  //   take data: {
  //   emails: [],
  //   subject: '',
  //   text: '',
  //   html: ``
  //   }
 try {
  
   const emails = data.emails.toString();
   const transporter = nodemailer.createTransport({
     host: process.env.MAILER_SERVER,
     port: process.env.MAILER_PORT_SSL1,
    secure: true, // true for 465, false for other ports
    auth: {
      user: process.env.MAILER_LOGIN,
      pass: process.env.MAILER_PASSWORD,
    },
  });
  // verify connection configuration
  transporter.verify(function (error, success) {
    if (error) {
      console.log(error);
    } else {
      console.log("Server is ready to take our messages");
    }
  });
  
  const info = await transporter.sendMail({
    from: `"KRAM Market" ${process.env.MAILER_LOGIN}`, // sender address
    to: emails, // list of receivers
    subject: data.subject, // Subject line
    text: data.text, // plain text body
    html: data.html, // html body
  }); 
  console.dir(info);
} catch (error) {
 console.log(error)
}
}
