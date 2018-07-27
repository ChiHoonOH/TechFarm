package com.itbank.TechFarm.james;

import java.text.SimpleDateFormat;

import javax.mail.Address;
import javax.mail.Message;

public class JamesPro {
	public JamesDTO writeEnvelope(Message message) throws Exception {
	      System.out.println("This is the message envelope");
	      System.out.println("---------------------------");
	      Address[] address;
	      JamesDTO jamesDTO = new JamesDTO();

	      // FROM
	      if ((address = message.getFrom()) != null) {
	         for (int j = 0; j < address.length; j++){
	        	 System.out.println("FROM: " + address[j].toString());
	        	 String addr=address[j].toString();
	        	 if(addr.toString().substring(0, 2).equals("=?")){
	        		 addr = address[j].toString().split("<")[1].split(">")[0];
	        	 }
	        	 jamesDTO.setFrom(addr);
	         }
	      }

	      // TO
	      if ((address = message.getRecipients(Message.RecipientType.TO)) != null) {
	         for (int j = 0; j < address.length; j++){
	        	 System.out.println("TO: " + address[j].toString());
	        	 jamesDTO.setTo(address[j].toString());
	         }
	      }

	      // SUBJECT
	      if (message.getSubject() != null){
	         System.out.println("SUBJECT: " + message.getSubject());
	         jamesDTO.setSubject(message.getSubject());
	      }
	      
	      // SentDate
	      if (message.getSentDate() != null){
	    	  System.out.println("SentDate: " + message.getSentDate());
	    	  SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh:mm");
	    	  jamesDTO.setSentDate(sdf.format(message.getSentDate()));
	      }
	      
	      return jamesDTO;
	   }
}
