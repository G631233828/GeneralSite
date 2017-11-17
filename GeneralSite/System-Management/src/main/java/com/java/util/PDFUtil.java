package com.java.util;

import java.io.File;
import java.io.FileOutputStream;

import com.itextpdf.text.Document;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

public class PDFUtil {
	public static void main(String[] args) {
		// 创建文档对象，将大小设置为A4
		// Document document=new Document(PageSize.A4);
		Document document = new Document(PageSize.A4, 20, 20, 20, 20);
		document.addTitle("1");//设置标题
		document.addSubject("2");//设置主题
		document.addKeywords("3");//设置关键字
		document.addAuthor("4");//设置作者
		document.addCreator("5");//设置生产者
		document.addCreationDate();//设置创建日期
		document.addHeader("6", "123");//设置文件夹信息
		try {
			File f = new File("d:\\itext.pdf");
			if (!f.exists()) {
				f.createNewFile();
			}
			// 输出为E:\AAA.PDF
			PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(f));
			// 打开文档
			document.open();
			// 在pdf文件中写入数据
			document.add(new Paragraph("Hello world,Hello iText"));
			// 关闭文档
			document.close();  
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
