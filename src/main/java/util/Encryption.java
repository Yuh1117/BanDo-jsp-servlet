package util;

import java.security.MessageDigest;

import org.apache.tomcat.util.codec.binary.Base64;

public class Encryption {
	public static String toSHA1(String s) {
		String salt = "asjrlkmcoewj@tjle;oxqskjhdjksjf1jurVn";
		String result = "";

		s = s + salt;
		try {
			byte[] dataBytes = s.getBytes("UTF-8");
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			result = Base64.encodeBase64String(md.digest(dataBytes));
		} catch (Exception e) {

		}
		return result;
	}
}
