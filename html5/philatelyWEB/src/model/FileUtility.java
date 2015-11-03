package model;

import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.fileupload.FileItem;


public class FileUtility {
	
public static void processUploadedFile(FileItem item){
	   String fieldName = item.getFieldName();
	    String fileName = item.getName();
	    String contentType = item.getContentType();
	    boolean isInMemory = item.isInMemory();
	    long sizeInBytes = item.getSize();
	    try {
			InputStream in= item.getInputStream();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
}

}
