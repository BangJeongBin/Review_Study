<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>사용자 답안 입력</title>
</head>
<body>
    <h1>사용자 답안 입력 (모르는 문제는 5번으로 입력)</h1>
    <form action="3.틀린문제확인.jsp" method="post">
        <table border="1">
            <%
                String[] answers = new String[100];
                for (int i = 0; i < 100; i++) {
                    answers[i] = request.getParameter("answer" + (i + 1));
                }
                session.setAttribute("answers", answers); // 정답을 세션에 저장
            %>
            <% for (int i = 1; i <= 100; i++) { %>
                <tr>
                    <td>문제 <%= i %>의 답안:</td>
                    <td><input type="text" name="answer<%= i %>" required></td>
                </tr>
            <% } %>
        </table>
        <button type="submit">답안 제출</button>
    </form>
</body>
</html>
