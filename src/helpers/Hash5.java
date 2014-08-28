package helpers;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Hash5 {
	
	
	public String getMd5Digest(String pInput) {
		BigInteger lHashInt = null;
		try {
		MessageDigest lDigest = MessageDigest.getInstance("MD5");
		lDigest.update(pInput.getBytes());
		lHashInt = new BigInteger(1, lDigest.digest());
		} catch (NoSuchAlgorithmException lException) {
		throw new RuntimeException(lException);
		}
		return String.format("%1$032X", lHashInt);
		}
	

}
