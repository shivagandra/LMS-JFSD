<%@ page contentType="text/html;charset=ISO-2022-JP" language="java" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<mt:admin title="Add Book">
    <jsp:attribute name="content">
        <div class="p-4">
          <h1 class="">Manage</h1>
          <!-- Breadcrumb -->
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item active"><a href="/admin/book" class="text-decoration-none">Book</a></li>
              <li class="breadcrumb-item active" aria-current="page">Add Book</li>
            </ol>
          </nav>
          <div>
            <div class="container">
              <form action="/admin/book/addBook" method="post" enctype="multipart/form-data">
                <div class="form-group mb-3">
                  <label for="name">Name</label>
                  <input type="text" class="form-control" id="name" name="name">
                </div>
                <div class="form-group mb-3">
                  <label for="price">Price</label>
                  <input type="number" class="form-control" id="price" name="price">
                </div>
                <div class="form-group mb-3">
                  <label for="edition">Edition</label>
                  <input type="number" class="form-control" id="edition" name="edition">
                </div>
                <div class="form-group mb-3">
                  <label for="file">File</label>
                  <input type="file" class="form-control" id="file" name="file">
                </div>
                <div class="form-group mb-3">
                  <label for="picture">Picture</label>
                  <input type="file" class="form-control" id="picture" name="picture">
                </div>
                <div class="form-group mb-3">
                  <label for="categories">Categories</label>
                  <select class="form-control" id="categories" name="categories" multiple>
                    <c:forEach var="category" items="${categories}">
                      <option value="${category.id}">${category.name}</option>
                    </c:forEach>
                  </select>
                </div>
                <div class="form-group mb-3">
                  <label for="authors">Authors</label>
                  <select class="form-control" id="authors" name="authors" multiple>
                    <c:forEach var="author" items="${authors}">
                      <option value="${author.id}">${author.firstName} ${author.lastName}</option>
                    </c:forEach>
                  </select>
                </div>
                <div class="form-group mb-3">
                  <label for="publishers">Publishers</label>
                  <select class="form-control" id="publishers" name="publishers" multiple>
                    <c:forEach var="publisher" items="${publishers}">
                      <option value="${publisher.id}">${publisher.name}</option>
                    </c:forEach>
                  </select>
                </div>
                <input type="submit" class="btn btn-success" value="Add" />
              </form>
            </div>
          </div>
        </div>
    </jsp:attribute>
</mt:admin>