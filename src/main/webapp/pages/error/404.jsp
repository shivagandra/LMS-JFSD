<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error 404</title>
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
            background: url("/resources/images/404.jpg") center/cover no-repeat;
        }
        .bg-img h1 {
            color: #fff;
            font-family: sans-serif;
            text-align: center;
        }
        .bg-img .btn {
            background: #e4640b;
            border: none;
            position: absolute;
            top: 20%;
            right: 10%;
        }

        .bg-img h2 {
            color: purple;
            position: absolute;
            top: 7%;
            left: 31%;
        }

        .bg-img .btn:hover {
            background: purple;
            border: none;
        }
    </style>
   </head>
<body>
  <div class="bg-img">
      <h2 class="fw-bold">Page you have request doesn't exist</h2>
      <a href="/" class="btn btn-primary">Back to Home</a>
  </div>
</body>
</html>