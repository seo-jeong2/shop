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
	//인코딩 
	request.setCharacterEncoding("UTF-8");

	// 폴더 경로 지정
	String dir = request.getServletContext().getRealPath("/upload");
	
	int max = 10 * 1024 * 1024; // 사진 사이즈 
	MultipartRequest mRequest = new MultipartRequest(request, dir, max, "utf-8", new DefaultFileRenamePolicy()); 
	
	// 기존 데이터 받아오기
	int goodsNo = Integer.parseInt(mRequest.getParameter("goodsNo"));
	GoodsImg img = new GoodsImg();
	GoodsImgDao imgDao = new GoodsImgDao();
	img = imgDao.selectImgOne(goodsNo);
	
	// 파라미터
	String imgTitle = mRequest.getParameter("goodsName");
	String imgOriginName = mRequest.getOriginalFileName("originFileName"); 
	String imgType = mRequest.getContentType("contentType"); 
	String imgName = mRequest.getFilesystemName("fileName"); 
	
	img.setGoodsName(imgTitle);
	img.setOriginFileName(imgOriginName);
	img.setContentType(imgType);
	img.setFileName(imgName);
	
	
	
	if (result < 1) {
		System.out.println("이미지 수정 실패!");
		response.sendRedirect(request.getContextPath()+"/admin/updateGoodsform.jsp?goodsNo="+img.getGoodsNo());
		return;
	}
	
	System.out.println("이미지 수정 성공!");
	response.sendRedirect(request.getContextPath()+"/admin/adminGoodsOne.jsp?goodsNo="+img.getGoodsNo());
	
%>