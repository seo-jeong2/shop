<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.Connection"%>
<%@page import="repository.*"%>
<%@page import="vo.*"%>
<%@page import="service.*"%>
<%@page import="java.io.File"%>

<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//Goods
	GoodsService goodsService = new GoodsService();
	Goods goods = new Goods();
	
	//GoodsImg
	GoodsImgDao goodsImgDao = new GoodsImgDao();
	GoodsImg goodsImg = new GoodsImg();
	
	request.setCharacterEncoding("utf-8"); //인코딩
	String dir = request.getServletContext().getRealPath("/upload"); //업로드 할 폴더 위치지정
	System.out.println(dir);
	
	int max = 10 * 1024 * 1024; 
	
	MultipartRequest mRequest = new MultipartRequest(request, dir, max ,"utf-8", new DefaultFileRenamePolicy());
	
	
	int goodsNo =Integer.parseInt( mRequest.getParameter("goodsNo"));
	String goodsName = mRequest.getParameter("goodsName");	
	
	int goodsPrice = Integer.parseInt(mRequest.getParameter("goodsPrice"));
	
	String contentType = mRequest.getContentType("file");
	String originFileName = mRequest.getOriginalFileName("file");
	String filename = mRequest.getFilesystemName("file");
	String soldOut = mRequest.getParameter("soldOut");
	
	
	
	System.out.println(goodsNo +"<-goodsNo");
	System.out.println(goodsName +"<-goodsName");
	System.out.println(goodsPrice +"<-goodsPrice");
	System.out.println(filename +"<-filename");
	System.out.println(contentType +"<-contentType");
	System.out.println(soldOut +"<-soldOut");
	
	
	
	
	
	String f1 = mRequest.getParameter("f");
	
		File f = new File(dir + "\\" + f1);
		if(f.exists()){//파일까지 삭제하고 새로 업로드 해야되기때문에, 수정란에도 필요
			f.delete();
		}
		
	
	
	System.out.println(contentType + "  : contentType");
	System.out.println(originFileName + " : originFilename");
	System.out.println(filename + " : filename");
	
	//goods
	goods.setGoodsNo(goodsNo);
	goods.setGoodsName(goodsName);
	goods.setGoodsPrice(goodsPrice);
	goods.setSoldOut(soldOut);
	goodsImg.setGoodsNo(goodsNo);
	goodsImg.setFileName(filename);
	goodsImg.setOriginFileName(originFileName);
	goodsImg.setContentType(contentType);
	
	goodsService.modifyGoods(goods, goodsImg, goodsNo);
	
	
	response.sendRedirect(request.getContextPath()+"/admin/adminGoodsList.jsp");
%>