package member.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class SendEmailServlet
 */
@WebServlet(urlPatterns="/sendEmailPwd.do", name="SendEmailServlet")
public class SendEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchId = request.getParameter("searchId");
		String searchEmail = request.getParameter("searchEmail");
		
		
		char[] charSet = new char[] {
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
				'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
				'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
				'~', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '+', '|', '<', '>', '?', ':', '{','}'
		};
		
		StringBuffer sb = new StringBuffer();
		
		int idx = 0;
		int len = charSet.length;
		String temPwd = null;
		for (int i=0; i<9; i++) {
			idx = (int) (len * Math.random());
			sb.append(charSet[idx]);
			
			temPwd = sb.toString();
		}
		System.out.println(temPwd);
		
		String encryptPwd = null;
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			byte[] bytes = temPwd.getBytes(Charset.forName("utf-8"));
			md.update(bytes);
			
			encryptPwd = Base64.getEncoder().encodeToString(md.digest());
		} catch (NoSuchAlgorithmException e1) {
			e1.printStackTrace();
		}

		System.out.println(encryptPwd);
		int result = new MemberService().sendTemPwd(searchId, encryptPwd);
		
		String sender = "hha6571@naver.com";
		String password = "rbgk1216^^";
		String receiver = searchEmail;
		String title = "[PET ME COME] 임시 비밀번호가 생성되었습니다.";
		String content = "<br>회원님의 임시 비밀번호는  <label style='color:Blue;'>" + sb + "</label>입니다. <br> 임시 비밀번호로 로그인 후 내 정보보기 > 비밀번호 변경에서 반드시 비밀번호를 변경하여 주시기 바랍니다.";
		
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.naver.com");
		prop.put("mail.smtp.auth", "true");
		
		Session session = Session.getDefaultInstance(prop, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, password);
			}
		});
		MimeMessage message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(sender));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			
			message.setSubject(title);
			message.setText(content, "UTF-8", "html");
			
			Transport.send(message);
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		response.getWriter().print(result);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
