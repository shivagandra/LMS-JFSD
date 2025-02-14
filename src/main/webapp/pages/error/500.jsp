<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error 500</title>
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
            background: url("/resources/images/500.jpg") center/cover no-repeat;
        }
        .bg-img h1 {
            color: #fff;
            font-family: sans-serif;
            text-align: center;
        }

        .bg-img h4 {
            color: #ffffff;
            position: absolute;
            top: 20%;
            left: 40%;
        }

        .bg-img .btn {
            background: #e44000;
            border: none;
            position: absolute;
            top: 33%;
            left: 40%
        }

        .bg-img .btn:hover {
            background: #9c2401;
            border: none;
        }
    </style>
</head>
<body>
<div class="bg-img">
    <h4 class="fw-bold">Oops sorry for the inconvenience.<br/> Please try again later!</h4>
    <a href="/" class="btn btn-primary">Back to Home</a>
</div>
</body>
</html>