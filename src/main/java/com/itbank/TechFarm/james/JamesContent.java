package com.itbank.TechFarm.james;

import java.io.BufferedOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Date;

import javax.mail.Multipart;
import javax.mail.Part;

public class JamesContent {
	
	public JamesDTO writePart(Part part) throws Exception {
		  //Object object = null;
		  
		JamesDTO jamesDTO = new JamesDTO();
	    System.out.println("----------------------------");
	    System.out.println("CONTENT-TYPE: " + part.getContentType());
	      
	      //check if the content is plain text
	      if (part.isMimeType("text/plain")) {
	         System.out.println("This is plain text");
	         System.out.println("---------------------------");
	         System.out.println((String) part.getContent());
	      } 
	      //check if the content has attachment
	      else if (part.isMimeType("multipart/*")) {
	         System.out.println("This is a Multipart");
	         System.out.println("---------------------------");
	         Multipart mp = (Multipart) part.getContent();
	         int count = mp.getCount();
	         for (int i = 0; i < count; i++){
	        	 if(mp.getBodyPart(i).isMimeType("image/*")) break;
	            jamesDTO = writePart(mp.getBodyPart(i));
	         }
	         return jamesDTO;
	      } 
	      //check if the content is a nested message
	      else if (part.isMimeType("message/rfc822")) {
	         System.out.println("This is a Nested Message");
	         System.out.println("---------------------------");
	         writePart((Part) part.getContent());
	      } 
	      //check if the content is an inline image
	      else if (part.isMimeType("image/jpeg")) {
	         System.out.println("--------> image/jpeg");
	         Object object = part.getContent();

	         InputStream x = (InputStream) object;
	         // Construct the required byte array
	         System.out.println("x.length = " + x.available());
	         int i = 0;
	         byte[] bArray = new byte[x.available()];
	         while ((i = (int) ((InputStream) x).available()) > 0) {
	            int result = (int) (((InputStream) x).read(bArray));
	            if (result == -1)
	            	break;
	         }
	         x.close();
	         FileOutputStream f2 = new FileOutputStream("/tmp/image.jpg");
	         f2.write(bArray);
	         f2.close();
	      } 
	      else if (part.getContentType().contains("image/")) {
	         System.out.println("content type" + part.getContentType());
	         File f = new File("image" + new Date().getTime() + ".jpg");
	         DataOutputStream output = new DataOutputStream(
	            new BufferedOutputStream(new FileOutputStream(f)));
	            com.sun.mail.util.BASE64DecoderStream test = 
	                 (com.sun.mail.util.BASE64DecoderStream) part.getContent();
	         byte[] buffer = new byte[1024];
	         int bytesRead;
	         while ((bytesRead = test.read(buffer)) != -1) {
	            output.write(buffer, 0, bytesRead);
	         }
	         output.close();
	      }else {
	         Object object = part.getContent();
	         if (object instanceof String) {
	            System.out.println("This is a string");
	            System.out.println("---------------------------");
	            System.out.println((String) object);
	            
	            jamesDTO.setContent((String)object);
	            return jamesDTO;
	         
	         }else if (object instanceof InputStream) {
	            System.out.println("This is just an input stream");
	            System.out.println("---------------------------");
	            InputStream is = (InputStream) object;
	            /*
	            is = (InputStream) object;
	            int c;
	            while ((c = is.read()) != -1)
	               System.out.write(c);
	            */
	         }else {
	            System.out.println("This is an unknown type");
	            System.out.println("---------------------------");
	            System.out.println(object.toString());
	         }
	         
	      }
	      return jamesDTO;

	   }
}
