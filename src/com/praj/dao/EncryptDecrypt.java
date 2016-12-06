package com.praj.dao;

import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;



public class EncryptDecrypt {

	Cipher cipher;
	KeyGenerator keyGenerator;
	SecretKey secretKey;
	static EncryptDecrypt encryptDecrypt = new EncryptDecrypt();
		
	private EncryptDecrypt(){
		try{
		keyGenerator= KeyGenerator.getInstance("AES");
		keyGenerator.init(128);
		secretKey = keyGenerator.generateKey();
		cipher = Cipher.getInstance("AES");
		}catch(Exception e){}
	}
	
	public static EncryptDecrypt getInstance(){
		return encryptDecrypt;
	}

	public String encrypt(String plainText) throws Exception {
		byte[] plainTextByte = plainText.getBytes();
		cipher.init(Cipher.ENCRYPT_MODE, secretKey);
		byte[] encryptedByte = cipher.doFinal(plainTextByte);
		Base64.Encoder encoder = Base64.getEncoder();
		String encryptedText = encoder.encodeToString(encryptedByte);
		return encryptedText;
	}

	public String decrypt(String encryptedText) throws Exception {
		Base64.Decoder decoder = Base64.getDecoder();
		byte[] encryptedTextByte = decoder.decode(encryptedText);
		cipher.init(Cipher.DECRYPT_MODE, secretKey);
		byte[] decryptedByte = cipher.doFinal(encryptedTextByte);
		String decryptedText = new String(decryptedByte);
		return decryptedText;
	}

}


