package com.kh.app.common;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class KhCoummunityUtils {


	public static String getRenamedFilename(String originalFilename) {
		String ext = "";
		int dotIndex = originalFilename.lastIndexOf(".");
		if(dotIndex > -1)
			ext = originalFilename.substring(dotIndex); // .jpg
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS_");

		DecimalFormat df = new DecimalFormat("000");
		
		return sdf.format(new Date()) + df.format(Math.random() * 1000) + ext;
	}

	
}
