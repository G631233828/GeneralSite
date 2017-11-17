package com.java.util;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class JsoupNews {
    private static String siteUrl = "http://www.stxx.fx.edu.sh.cn/app-web-portal/web2/index"; // 需要解析的网站地址
    // 获取菜单列表
    private static String body = "div.nav_main>ul[id=nav_all]"; // 获取的样式
    private static String menuName = "课程教学"; // 想要获取菜单的名称
    // 获取新闻列表
    private static String getsubcontent = "div.right>div.b11>div.content1>ul.newst>li>a";// tr下的list_tr样式下的td下的a标签
    // 获取新闻div
    private static String getcontent = "div.main3>div.b11";
    // 新闻文字内容
    private static String messages = "div.content";
    // 新闻标题
    // private static String title = "tr>td[align=center]>font";
    private static String titles = "div>h1";

    /*
     * private static String pages = "div.right>div.b11>div.content1>div.apage";
     */

    private static String data = "pageNo";
    // 总页面
    private static int allpage = 2;

    
    /***
     * 
     * @param siteUrl        
     * 			网站url
     * @param body
     * 			获取菜单所在标签
     * @param menuName
     * 			需要匹配的菜单名称
     * @param getsubcontent
     * 			获取新闻列表
     * @param getcontent
     * 			获取新闻信息所在标签
     * @param messages
     *			新闻内容 			
     * @param titles
     * 			新闻标题
     * @param data
     * 			分页标识
     * @param allpage
     * 			新闻总页数
     */
    public static void getHtmlMessage(String siteUrl,String body,String menuName,String getsubcontent,String getcontent,String messages,String titles,String data,int allpage) {
	try {
	    Document doc = Jsoup.connect(siteUrl).get();
	    Element contents = doc.select(body).first();
	    Elements links = contents.getElementsByTag("a");

	    for (Element link : links) {
		String linkHref = link.attr("abs:href");
		String linkText = link.text();
		if (menuName.equals(linkText)) {
		    // 通过分页获取数据
		    for (int i = 1; i <= allpage; i++) {
			String fylinHref = linkHref + "&" + data + "=" + i;
			System.out.println(linkHref + "&" + data + "=" + i + "," + linkText);
			// 新闻列表
			Document subdoc = Jsoup.connect(fylinHref).post();

			Elements subcontent = subdoc.select(getsubcontent); // 在h3元素之后的a元素

			for (Element sublink : subcontent) {
			    String sublinkHref = sublink.attr("abs:href");
			    String sublinkText = sublink.text();
			    System.out.println(sublinkHref + "," + sublinkText);

			    // 新闻内容

			    Document contentdoc = Jsoup.connect(sublinkHref).get();
			    Elements content = contentdoc.select(getcontent); //
			    // 在h3元素之后的a元素
			    for (Element contentlink : content) {
				String title = contentlink.select(titles).text();
				System.out.println("新闻标题：" + title);
				// 解析新闻内容
				Elements messagecontent = contentlink.select(messages);
				for (Element ms : messagecontent) {
				    Elements images = ms.getElementsByTag("img");
				    // 获取所有图片内容
				    for (Element imgs : images) {
					String imgurl = imgs.absUrl("src");
					// System.out.println(imgurl);
					imgs.attr("src", imgurl);
				    }
				}
				String message = contentlink.select(messages).html();
				System.out.println(message);
			    }

			}
		    }

		}
	    }
	} catch (IOException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
    }

    public static void main(String[] args) {
	
	JsoupNews.getHtmlMessage(siteUrl, body, menuName, getsubcontent, getcontent, messages, titles, data, allpage);
    }
    
    
    
    
    
    
    
}

/* http://www.stxx.fx.edu.sh.cn/app-web-portal/uploadmr/1495172026462.png */