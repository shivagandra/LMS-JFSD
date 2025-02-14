<html>
<head>
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
<div>
    <!-- Navbar NoTime -->
    <nav class="navbar fixed-top navbar-expand-sm navbar-light bg-light opacity-75">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="#">Liygen</a>
            <button class="navbar-toggler" data-toggle="collapse" data-target="#navbar-menu">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbar-menu">
                <div class="navbar-nav me-auto mb-2 mb-lg-0">
                    <a class="navbar-brand" href="/">Home</a>
                    <a class="navbar-brand" href="#">About</a>
                    <a class="navbar-brand" href="/contactUs">Contact Us</a>
                </div>
                <div class="navbar-nav ms-auto">
                    <a class="btn btn-outline-primary m-1" href="/login">Log In</a>
                    <a class="btn btn-outline-success m-1" href="/registration">Sign Up</a>
                </div>
            </div>
        </div>
    </nav>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100 h-100" src="/resources/images/Home.jpg" alt="First slide">
                <div class="carousel-caption d-none d-sm-block">
                    <h1 class="fw-bold">Liygen</h1>
                    <h3 class="fw-bold">where library meets oxygen</h3>
                    <h3 class="fw-bold">Lets <a class="btn btn-sm btn-light" href="/registration">Get Started</a></h3>
                </div>
            </div>
            <div class="carousel-item">
                <img class="d-block w-100 h-100" src="/resources/images/Home2.jpg" alt="Second slide">
                <div class="carousel-caption d-none d-sm-block" style="color: brown;">
                    <h1 class="fw-bold">Podcast</h1>
                    <h2 class="fw-bold">1K+ Podcasts and e-books</h2>
                </div>
            </div>
            <div class="carousel-item">
                <img class="d-block w-100 h-100" src="/resources/images/Home3.jpg" alt="Third slide">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
        </a>
    </div>
</div>
</body>
</html>