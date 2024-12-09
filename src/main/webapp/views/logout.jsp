<%
	//Limpo a variável de sessão
	session.invalidate();

	//Redireciono para a página de início
	response.sendRedirect("/Velvet_v2/views/login.jsp");

%>