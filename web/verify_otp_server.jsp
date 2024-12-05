<%@page contentType="text/html" pageEncoding="UTF-8" import=" java.io.*,java.util.*,java.util.Random,java.sql.*,javax.mail.*,javax.mail.internet.*,javax.activation.*"%>

<%
    String otp1 = "";
    String error_and_msg = "";
    String redirect = "verify_otp.jsp";
    String current_otp = "";

    
    if (session.getAttribute("email") != null)
     {
    if (request.getParameter("verify_otp") != null)
    {

        String otp = request.getParameter("otp");

        if (session.getAttribute("current_otp") != null)
        {
            current_otp = session.getAttribute("current_otp").toString().trim();
            session.setAttribute("current_otp", null);

            if (otp.equals(current_otp)) 
            {
                redirect = "change_password.jsp";
               
                session.setAttribute("otp", "true");

            } else {

                error_and_msg = "Invalid OTP";
            }
        } 
        
        else {
         error_and_msg = "First Send OTP";
}
        }

        if (request.getParameter("send_otp") != null) {

            String user_email = session.getAttribute("email").toString();

            final String username = "movieplus107@gmail.com";////
            final String password = "vddxzwhoaevkksks";
            String smtphost = "smtp.gmail.com";
            String compression = "smtp info";
            String from = "movieplus107@gmail.com";
            String to = user_email;
            String numbers = "0123456789";

            // Using random method 
            Random rndm_method = new Random();

            char[] otp = new char[4];

            for (int i = 0; i < 4; i++) {
                // Use of charAt() method : to get character value 
                // Use of nextInt() as it is scanning the value as int 

                otp[i] = numbers.charAt(rndm_method.nextInt(numbers.length()));
                otp1 += otp[i];

            }

            String body = "Your OTP is : " + otp1;
            Transport myTransport = null;
            try {
                Properties props = System.getProperties();
                props.put("mail.smtp.user", username);
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.port", "465");// 465
                props.put("mail.smtp.starttls.enable", "true");
                props.put("mail.smtp.debug", "true");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.socketFactory.port", "465");
                props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                props.put("mail.smtp.socketFactory.fallback", "false");

                Session mailSession = Session.getDefaultInstance(props, null);
                mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
                    protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                        return new javax.mail.PasswordAuthentication(username, username);
                    }
                });
                Message msg = new MimeMessage(mailSession);
                msg.setFrom(new InternetAddress(from));
                InternetAddress[] address = {new InternetAddress(to)};
                msg.setRecipients(Message.RecipientType.TO, address);
                msg.setSubject(compression);
                msg.setText(body);
                msg.setSentDate(new java.util.Date());

                myTransport = mailSession.getTransport("smtp");
                myTransport.connect(smtphost, username, password);
                msg.saveChanges();
                myTransport.sendMessage(msg, msg.getAllRecipients());
                myTransport.close();

                session.setAttribute("current_otp", otp1.trim());
                error_and_msg = "Check Your Email";
                redirect = "verify_otp.jsp";

            } catch (Exception e) {
                out.print(e);

                redirect = "verify_otp.jsp";

                error_and_msg = "Server Error";
            }

        }
}

else
{
redirect="login.jsp";
}
        session.setAttribute("error_and_msg", error_and_msg);
        response.sendRedirect(redirect);

%>
