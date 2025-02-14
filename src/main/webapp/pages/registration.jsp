<html>
<head>
    <title>Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
    <nav class="navbar navbar-expand-sm navbar-light bg-light shadow">
        <div class="container">
            <a href="/" class="navbar-brand fw-bold">Liygen</a>
            <button class="navbar-toggler" data-toggle="collapse" data-target="#navbar-menu">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbar-menu">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item nav-link"><a class="nav-link" href="#">About</a></li>
                    <li class="nav-item nav-link"><a class="nav-link" href="/contactUs">Contact Us</a></li>
                    <li class="nav-item nav-link"><a class="nav-link" href="/login">Login</a></li>
                    <li class="nav-item nav-link"><a class="btn btn-outline-success btn-sm mt-1 rounded-pill px-4" href="#">Get Started</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container m-auto mt-5">
        <% String error = (String) request.getAttribute("error"); %>
        <div class="card container col-lg-5 col-sm-12 p-4 mt-4 mb-4 text-secondary rounded-4">
            <% if(error !=  null) {%>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <%=error %>
                <button type="button" class="btn-close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true"></span>
                </button>
            </div>
            <% } %>
            <h2 class="mb-5 text-secondary"><strong>Register</strong></h2>
            <form action="" method="post">
                <div class="form-group mb-3">
                    <label for="firstName">First Name</label>
                    <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Enter your first name" required/>
                </div>
                <div class="form-group mb-3">
                    <label for="lastName">Last Name</label>
                    <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Enter your last name" required/>
                </div>
                <div class="form-group mb-3">
                    <label for="email">Email address</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Ex: name@example.com" required/>
                </div>
                <div class="form-group mb-4">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Enter a password for your account" pattern=".{8,}" title="Minimum 8 characters are required" required/>
                </div>
                <input type="submit" class="btn btn-success col-12" value="Submit"/>
            </form>
        </div>
    </div>
</body>
</html>