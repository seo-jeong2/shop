<%@page import="service.CartService"%>
<%@page import="vo.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
       if (session.getAttribute("login" + session.getAttribute("user")) == null) {
       	response.sendRedirect(request.getContextPath() + "/loginForm.jsp?errorMsg = 로그인하세요");
       	return;
       
       }

       int count = Integer.parseInt(request.getParameter("cartCount"));
       int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));

       //값 확인
       System.out.println(" count : " + count);
       System.out.println("goodsNo : " + goodsNo);

       
       request.setCharacterEncoding("utf-8");

       Cart cart = new Cart();

      
       cart.setGoodsNo(goodsNo);
       cart.setCartTotalnum(count);

       //지금현재 접속한 id값d을 customerId값에 넣어준다.
       cart.setCustomerId((String) session.getAttribute("id"));

       CartService cartService = new CartService();
       cartService.insertCart(cart);

       System.out.println("장바구니 추가 성공");

       response.sendRedirect(request.getContextPath() + "/Resources/customerGoodsOne.jsp?goods_no=" + goodsNo);
       %>
