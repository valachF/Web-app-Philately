package model;

import javax.servlet.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;


import javax.servlet.http.*;
import javax.servlet.ServletException;


import philatelyejb.PhilatelySessionLocal;

import beans.Stamp;

import java.io.*;
import java.sql.Blob;

public class ImageServlet  extends HttpServlet
{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest  request, HttpServletResponse response)
			     throws ServletException, IOException
    {
    	
        try{
        	Context context = new InitialContext();
        	System.out.println("!!!--- U SERVLETU ----!!! ");
        	PhilatelySessionLocal philatelyBeanLocal = 
				(PhilatelySessionLocal)context.lookup("philatelyEAR/PhilatelySession/local");

			String idStamp=request.getParameter("idStamp");

	    	
	    	Stamp stamp = philatelyBeanLocal.getStamp(Integer.parseInt(idStamp));
	    	Blob photo =stamp.getPhoto();
			
	    	 //konvertujemo Blob u byte[]
            int blobLength=(int)photo.length();
            byte[] blobAsBytes=photo.getBytes(1, blobLength);
            
            System.out.println("Blob:--- "+photo);
            System.out.println("Duzina bloba:--- "+blobLength);
            System.out.println("Blob kao niz:--- "+blobAsBytes);
            
            response.setContentType("image/gif");
            ServletOutputStream out = response.getOutputStream();
           
            out.write(blobAsBytes);
            out.flush();
        }
        catch(Exception e){
           e.printStackTrace();
	       return;
        }

    }    
      
}
