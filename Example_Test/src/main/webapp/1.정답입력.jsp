<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>문제 정답 입력</title>
</head>
<body>
    <h1>문제 정답 입력</h1>
    <form action="2.답안제출.jsp" method="post">
        <table border="1">
            <% for (int i = 1; i <= 100; i++) { %>
                <tr>
                    <td>문제 <%= i %>의 정답:</td>
                    <td><input type="text" name="answer<%= i %>" required></td>
                </tr>
            <% } %>
        </table>
        <button type="submit">정답 입력 완료</button>
    </form>
</body>
</html>
