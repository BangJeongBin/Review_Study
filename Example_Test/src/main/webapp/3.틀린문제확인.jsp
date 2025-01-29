<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>결과</title>
    <style>
        .correct { color: red; } /* 정답을 빨간색으로 표시 */
    </style>
</head>
<body>
    <h1>결과</h1>
    <%
        // 세션에서 정답 가져오기 (널 체크 포함)
        String[] answers = (String[]) session.getAttribute("answers");
        if (answers == null) {
            answers = new String[100];
            for (int i = 0; i < 100; i++) answers[i] = "없음"; // 기본값 설정
        }

        String[] userAnswers = new String[100];
        int score = 0;
        int score1 = 0;
        int score2 = 0;
        int score3 = 0;
        int score4 = 0;
        int score5 = 0;
        
        StringBuilder incorrectDetails = new StringBuilder();

        for (int i = 0; i < 100; i++) {
            userAnswers[i] = request.getParameter("answer" + (i + 1));

            // 정답과 비교 (널 체크)
            if (userAnswers[i] != null && userAnswers[i].equals(answers[i])) {
                score++;
                if (i < 20) {
                	score1++;
                } else if (i < 40) {
                	score2++;
                } else if (i < 60) {
                	score3++;
                } else if (i < 80) {
                	score4++;
                } else if (i < 100) {
                	score5++;
                }
            } else {
                // 틀린 문제의 상세 정보 추가
                incorrectDetails.append("<tr>")
                    .append("<td>").append(i + 1).append("</td>") // 문제 번호
                    .append("<td class='correct'>").append(answers[i] != null ? answers[i] : "없음").append("</td>") // 정답 (빨간색)
                    .append("<td>").append(userAnswers[i] != null ? userAnswers[i] : "없음").append("</td>") // 사용자가 입력한 답
                    .append("</tr>");
            }
        }
    %>

    <p>총 점수: <%= score %> / 100</p>
    <br>
    <p>1과목: <%= score1 %> / 20</p>
    <p>2과목: <%= score2 %> / 20</p>
    <p>3과목: <%= score3 %> / 20</p>
    <p>4과목: <%= score4 %> / 20</p>
    <p>5과목: <%= score5 %> / 20</p>
    <h2>틀린 문제</h2>
    <%
        if (incorrectDetails.length() > 0) {
    %>
        <table border="1">
            <tr>
                <th>문제 번호</th>
                <th>정답</th>
                <th>사용자 답안</th>
            </tr>
            <%= incorrectDetails.toString() %>
        </table>
    <%
        } else {
    %>
        <p>모든 문제를 맞췄습니다!</p>
    <%
        }
    %>
    <a href="1.정답입력.jsp">다시 시작하기</a>
</body>
</html>
