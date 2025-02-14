<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error 403</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        .bg-img {
            width: 100%;
            height: 100vh;
            background: url("/resources/images/403.jpg") top/cover no-repeat;
        }
        .bg-img h1 {
            color: #fff;
            font-family: sans-serif;
            text-align: center;
        }

        .bg-img h2 {
            position: absolute;
            top: 5%;
            left: 30%;
        }

        .bg-img .btn {
            position: absolute;
            top: 15%;
            left:40%;
        }
    </style>
</head>
<body>
<div class="bg-img">
    <h2 class="text-danger fw-bold">Your are not authorized to access this page</h2>
    <a href="/" class="btn btn-outline-danger">Back to Home</a>
</div>
</body>
</html>