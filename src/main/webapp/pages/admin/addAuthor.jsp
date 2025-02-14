<%@ page contentType="text/html;charset=ISO-2022-JP" language="java" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<mt:admin title="Add Author">
    <jsp:attribute name="content">
        <div class="p-4">
            <h1 class="">Manage</h1>
            <!-- Breadcrumb -->
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active"><a href="/admin/author" class="text-decoration-none">Author</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Add Author</li>
                </ol>
            </nav>
            <div>
                <div class="container">
                    <form action="/admin/author/addAuthor" method="post">
                        <div class="form-group mb-3">
                            <label for="firstName">Frist Name</label>
                            <input type="text" class="form-control" id="firstName" name="firstName">
                        </div>
                        <div class="form-group mb-3">
                            <label for="lastName">Last Name</label>
                            <input type="text" class="form-control" id="lastName" name="lastName">
                        </div>
                        <div class="form-group mb-3">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="price" name="email">
                        </div>
                        <input type="submit" class="btn btn-success" value="Add" />
                    </form>
                </div>
            </div>
        </div>
    </jsp:attribute>
</mt:admin>