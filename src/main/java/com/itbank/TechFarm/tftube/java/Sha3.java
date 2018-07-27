package com.itbank.TechFarm.tftube.java;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import org.bouncycastle.jcajce.provider.digest.SHA3;
import org.bouncycastle.jcajce.provider.digest.SHA3.DigestSHA3;
import org.bouncycastle.util.encoders.Hex;

public class Sha3 {
	public String Digest_Sha3(File file) throws Exception {	    
	    DigestSHA3 digestSHA3 = new SHA3.Digest256();
	        
	    InputStream fis=new FileInputStream(file);
	    
	    int n=0;
	    byte[] space=new byte[8192];//size?	    
	    
	    while (n != -1) {//up to finalizing
	        n = fis.read(space);//return num of byte
	        if (n > 0) {
	            digestSHA3.update(space, 0, n);
	            			//space,startpoint,num of byte for updating	            
	        }
	    }   	    	    
	    fis.close();	    
	    return Hex.toHexString(digestSHA3.digest());
	}
}
