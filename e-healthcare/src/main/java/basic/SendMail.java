package basic;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


class Mailer{  
    public static void send(String to,String sub,String msg){  
          //Get properties object    
          Properties props = new Properties();    
          props.put("mail.smtp.host", "smtp.gmail.com");    
          props.put("mail.smtp.socketFactory.port", "465");    
          props.put("mail.smtp.socketFactory.class",    
                    "javax.net.ssl.SSLSocketFactory");    
          props.put("mail.smtp.auth", "true");    
          props.put("mail.smtp.port", "465");    
          props.put("mail.smtp.ssl.protocols", "TLSv1.2");
          //get Session   
          Session session = Session.getDefaultInstance(props,    
           new javax.mail.Authenticator() {    
           protected PasswordAuthentication getPasswordAuthentication() {    
           return new PasswordAuthentication("s90316362@gmail.com","dzhpheojwttvtjqd");  
           }    
          });    
          //compose message    
          try {    
        	  
           MimeMessage message = new MimeMessage(session);    
           message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
           message.setSubject(sub, "UTF-8");    
  //         message.setText(msg, "utf-8", "html");    
           
           message.setContent(msg, "text/html");
          
          
           message.saveChanges();
           //send message  
           Transport.send(message);    
           System.out.println("message sent successfully");    
          } catch (MessagingException e) {throw new RuntimeException(e);}    
             
    }  
}  
public class SendMail{    
 public static void main(String[] args) {   
 
     //from,password,to,subject,message  
     Mailer.send("email","msg","msg");  
     //change from, password and to  
 }    
 
 
 public void send(String to,String sub,String msg){  
     //Get properties object    
     Properties props = new Properties();    
     props.put("mail.smtp.host", "smtp.gmail.com");    
     props.put("mail.smtp.socketFactory.port", "465");    
     props.put("mail.smtp.socketFactory.class",    
               "javax.net.ssl.SSLSocketFactory");    
     props.put("mail.smtp.auth", "true");    
     props.put("mail.smtp.port", "465");    
     props.put("mail.smtp.ssl.protocols", "TLSv1.2");
     //get Session   
     Session session = Session.getDefaultInstance(props,    
      new javax.mail.Authenticator() {    
      protected PasswordAuthentication getPasswordAuthentication() {    
      return new PasswordAuthentication("s90316362@gmail.com","dzhpheojwttvtjqd");  
      }    
     });    
     //compose message    
     
     try {    
      MimeMessage message = new MimeMessage(session);    
      message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
      message.setSubject(sub);    
//      message.setText(msg);    
      message.setContent(msg, "text/html");
    //send message  
      Transport.send(message);    
      System.out.println("message sent successfully");    
     } catch (MessagingException e) {throw new RuntimeException(e);}    
        
}  
}    