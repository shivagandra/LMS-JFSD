<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Home</title>
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<style>
    :root {
        --d: None;
        --backgound: #ffff;
        --opacity: 1;
    }
    .bg-transparent.scrolled {
        background-color: #121825 !important;
    }

    .card {
        transition: transform .2s;
    }

    .card:hover {
        /*color: #ffff;*/
        transform: scale(1.15);
        border-color: black;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        --d: flex;
        --backgound: black;
        --opacity: 0.5;
    }

    .card-img {
        opacity: var(--opacity);
    }

    .card-img-overlay {
        display: var(--d);
        flex-direction: column;
        justify-content: end;
        /*bottom: 0;*/
    }

</style>
<body>
    <div>
        <%--style="background-color: #1d1b31"--%>
        <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-transparent">
            <div class="container-fluid mx-5">
                <a class="navbar-brand fw-bold" href="#">Liygen</a>
                <button class="navbar-toggler" data-toggle="collapse" data-target="#navbar-menu">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <div class="navbar-nav me-auto mb-2 mb-lg-0">
                    </div>
                    <div class="navbar-nav ms-auto">
                        <li class="dropdow-menu">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                ${user.firstName} ${user.lastName}
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="right: 0">
                                <a class="dropdown-item" href="/accounts/profile/${user.id}">Profile</a>
<%--                                <a class="dropdown-item" href="{% url 'change_password' %}">Change Password</a>--%>
<%--                                <a class="dropdown-item" href="{% url 'delete_account' %}">Delete Account</a>--%>
<%--                                <a class="dropdown-item" href="{% url 'delete_history' %}">Delete History</a>--%>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="/logout">Sign out</a>
                            </div>
                    </div>
                </div>
            </div>
        </nav>
        <div id="carouselExampleIndicators" class="carousel slide d-none d-sm-block" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <a class="carousel-item active h-100" href="#">
                    <video class="img-fluid w-100" autoplay loop muted>
                        <source src="/resources/videos/DNA.mp4" type="video/mp4" />
                    </video>
                    <div class="carousel-caption d-none d-md-block">
                        <h2 class="fw-bold">Science</h2>
                        <p class="fw-bold">Liygen specials</p>
                        <p>
                            Exclusive science collection by liygen. Find 500+ science books and articles.
                        </p>
                    </div>
                </a>
                <a class="carousel-item h-100" href="#">
                    <video class="img-fluid w-100" autoplay loop muted>
                        <source src="/resources/videos/Podcast.mp4" type="video/mp4" />
                    </video>
                    <div class="carousel-caption d-none d-md-block">
                        <h2 class="fw-bold"><i class='bx bx-podcast'></i> Podcast</h2>
                        <p class="fw-bold">500+ Podcasts and Audio books</p>
                        <p>
                            Catchup with latest of books to international news
                        </p>
                    </div>
                </a>
                <div class="carousel-item h-100">
                    <img class="d-block w-100 h-100" src="/resources/images/Home.jpg" alt="Third slide">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
            </a>
        </div>
        <div>
            <div class="row m-2 mt-5 mb-5">
                <c:forEach var="book" items="${books}">
                    <div class="col">
                        <div class="card">
                            <img class="card-img" src="data:image/jpeg;base64,${book.picture}" alt="Card image"
                            >
                            <div class="card-img-overlay">
                                <h5 class="card-title">${book.name}</h5>
                                <div class="d-flex justify-content-between">
                                    <p class="card-text">Edition: ${book.edition}</p>
                                    <p class="card-text">Category:
                                    <c:forEach var="category" items="${book.categories}">
                                        ${category}
                                    </c:forEach>
                                    </p>
                                </div>
                                <a href="/download/${book.id}" class="btn btn-primary">
                                    Download</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <script>
        $(window).scroll(function(){
            $('nav').toggleClass('scrolled', $(this).scrollTop() > 700);
        });
    </script>
</body>
</html>