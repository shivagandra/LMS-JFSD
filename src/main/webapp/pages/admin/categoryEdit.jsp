<%@ page contentType="text/html;charset=ISO-2022-JP" language="java" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<mt:admin title="Edit Category">
    <jsp:attribute name="content">
        <c:set var="book" value="${category}" />
        <div class="p-4">
            <h1 class="">Manage</h1>
            <!-- Breadcrumb -->
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active"><a href="/admin/category" class="text-decoration-none">Category</a></li>
                    <li class="breadcrumb-item active">
                        <a href="/admin/category/${category.id}" class="text-decoration-none">View Category</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">Edit Category</li>
                </ol>
            </nav>
            <div>
                <div class="container">
                    <form action="/admin/category/edit" method="post" enctype="multipart/form-data">
                        <div class="form-group mb-3">
                            <label for="id">Id</label>
                            <input type="number" class="form-control" id="id" name="id" value="${category.id}" readonly>
                        </div>
                        <div class="form-group mb-3">
                            <label for="firstName">Name</label>
                            <input type="text" class="form-control" id="name" name="name" value="${category.name}">
                        </div>
                        <div class="form-group mb-3">
                            <label for="books">Books</label>
                            <select class="form-control" id="books" name="books" multiple>
                                <c:forEach var="book" items="${books}">
                                  <option value="${book.id}">${book.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <input type="submit" class="btn btn-success" value="Update" />
                    </form>
                </div>
            </div>
        </div>
    </jsp:attribute>
</mt:admin>