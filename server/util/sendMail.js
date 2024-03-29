import nodemailer from "nodemailer";

export async function sendMail(mailTo, aboutText) {
  return new Promise(async (resolve, reject) => {

    const transporter = nodemailer.createTransport({
      service: 'hotmail',
      auth: {
        user: process.env.EMAIL_ADDRESS,
        pass: process.env.MAILPASSWORD
      }
    });

    const mailOptions = {
      from: process.env.EMAIL_ADDRESS,
      to: mailTo,
      subject: 'Wizard World',
      text: aboutText
    };

    transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        reject("Mail error: " + error);
      } else {
        resolve("Mail has been sent")
      }
    });
  });
}
