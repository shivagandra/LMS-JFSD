<html>
<head>
    <title>Confirm Your Mail</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>
<div>
    <div class="container col-6 m-auto mt-5">
        <div class="card p-5 rounded-4 bg-light shadow" role="alert">
            <%
                String msg = (String) request.getAttribute("msg");
                if(msg.equalsIgnoreCase("confirmed")) {
            %>
            <h2 class="alert-heading fw-bold fst-italic">Email Verified</h2>
            <hr/>
            <h4 class="text-success">Email verification successfully!</h4>
            <p>Your email has been verified successfully! Kindly  login <a href="/login" class="link-primary text-decoration-none">here</a>.</p>
            <% } else { %>
            <h2 class="alert-heading fw-bold fst-italic">Email Verification failed</h2>
            <hr/>
            <h4 class="text-danger"><%=msg%></h4>
            <% } %>
        </div>
    </div>
</div>
</body>
</html>