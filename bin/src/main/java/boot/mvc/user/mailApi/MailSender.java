package boot.mvc.user.mailApi;

import org.apache.commons.lang3.RandomStringUtils;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class MailSender {

    static String randompass="";
    public static String getRamdomPassword(int size) {
        String randomPw=RandomStringUtils.randomAlphanumeric(size);
        return randomPw;
    }

    public static void mailSend(String email) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("treasure2hy@gmail.com", "tbndmhiceyolhnjz");
            }
        });

        randompass=getRamdomPassword(10);
        String receiver = email; // 메일 받을 주소
        String title = "TREASURE 임시 비밀번호 발급";
        String content = "<h2 style='color:blue'>"+randompass+"</h2><br>임시 비밀번호입니다.<br>이후 꼭 비밀번호를 변경해주세요.<br>";
        content+="TREASURE 바로가기 : <a href='http://localhost:8080/user/loginForm'></a>";
        Message message = new MimeMessage(session);
        try {
            message.setFrom(new InternetAddress("treasure2hy@gmail.com", "관리자", "utf-8"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
            message.setSubject(title);
            message.setContent(content, "text/html; charset=utf-8");

            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String getRandompass() {
        return randompass;
    }

}