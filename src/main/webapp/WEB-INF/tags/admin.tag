<%@tag language="java" pageEncoding="ISO-2022-JP" %>
<%@attribute name="title" required="true" rtexprvalue="true" %>
<%@attribute name="content" fragment="true" %>
<html>
<head>
    <title>${title}</title>
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://kit.fontawesome.com/7c8348fa0b.js" crossorigin="anonymous"></script>
    <link href="/resources/css/adminHome.css" rel="stylesheet" >
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<body>
<div>
    <div class="sidebar close">
        <div class="logo-details">
            <i class='bx bx-library'></i>
            <span class="logo_name">Liygen</span>
        </div>
        <ul class="nav-links">
            <li>
                <a href="/admin/home">
                    <i class='bx bx-grid-alt' ></i>
                    <span class="link_name">Dashboard</span>
                </a>
                <ul class="sub-menu blank">
                    <li><a class="link_name" href="/admin/home">Dashboard</a></li>
                </ul>
            </li>
            <li>
                <a href="/admin/accounts">
                    <i class='bx bx-user-circle'></i>
                    <span class="link_name">Users</span>
                </a>
                <ul class="sub-menu blank">
                    <li><a class="link_name" href="/admin/accounts">Accounts</a></li>
                </ul>
            </li>
            <li>
                <div class="icon-link">
                    <a href="#">
                        <i class='bx bx-wrench'></i>
                        <span class="link_name">Manage</span>
                    </a>
                    <i class='bx bxs-chevron-down arrow' ></i>
                </div>
                <ul class="sub-menu">
                    <li><a class="link_name" href="#">Manage</a></li>
                    <li><a href="/admin/book">Book</a></li>
                    <li><a href="/admin/author">Author</a></li>
                    <li><a href="/admin/category">Category</a></li>
                    <li><a href="/admin/publisher">Publisher</a></li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class='bx bx-podcast'></i>
                    <span class="link_name">Podcast</span>
                </a>
                <ul class="sub-menu blank">
                    <li><a class="link_name" href="#">Podcast</a></li>
                </ul>
            </li>
            <li>
                <a href="/admin/message">
                    <i class='bx bxl-messenger'></i>
                    <span class="link_name">Messages</span>
                </a>
                <ul class="sub-menu blank">
                    <li><a class="link_name" href="/admin/message">Messages</a></li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class='bx bx-cog' ></i>
                    <span class="link_name">Settings</span>
                </a>
                <ul class="sub-menu blank">
                    <li><a class="link_name" href="#">Settings</a></li>
                </ul>
            </li>
            <li>
                <div class="profile-details">
                    <div class="profile-content">
                        <img src="/resources/images/404.jpg" alt="profileImg">
                    </div>
                    <div class="name-job">
                        <div class="profile_name"><sec:authentication property="principal.firstName" /></div>
                        <div class="job"><sec:authentication property="principal.appUserRole" /></div>
                    </div>
                    <a href="/logout" class="logout"><i class='bx bx-log-out'></i></a>
                </div>
            </li>
        </ul>
    </div>
    <div class="home-section">
        <jsp:invoke fragment="content"></jsp:invoke>
    </div>
</div>
<script>
    let arrow = document.querySelectorAll(".arrow");
    for (var i = 0; i < arrow.length; i++) {
        arrow[i].addEventListener("click", (e)=>{
            let arrowParent = e.target.parentElement.parentElement;//selecting main parent of arrow
            arrowParent.classList.toggle("showMenu");
        });
    }
    let sidebar = document.querySelector(".sidebar");
    let sidebarBtn = document.querySelector(".bx-library");
    console.log(sidebarBtn);
    sidebarBtn.addEventListener("click", () => {
        sidebar.classList.toggle("close");
    });
</script>
</body>
</html>