<%@ page language="java" contentType="text/event-stream"
	pageEncoding="UTF-8"%>
retry: 2000
<%
String[] symbols = new String[] { "Samsung", "LG", "SK" };
for (String symbol : symbols) {
	int delta = (int) (Math.random() * 10);

	if (delta < 7) {
		if (System.currentTimeMillis() % 2 == 0)
			delta = -delta;
%>
data: <%=symbol%>
data: <%=delta%>

<%
	}
}
%>