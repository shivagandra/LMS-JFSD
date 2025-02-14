<%@ page contentType="text/html;charset=ISO-2022-JP" language="java" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<mt:admin title="View Book">
    <jsp:attribute name="content">
        <div class="p-4">
          <h1 class="">Manage</h1>
          <!-- Breadcrumb -->
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item active"><a href="/admin/book" class="text-decoration-none">Book</a></li>
              <li class="breadcrumb-item active" aria-current="page">View Book</li>
            </ol>
          </nav>
          <div>
            <div>
                <table class="table table-hover">
                    <thead class="table-dark">
                    <tr>
                        <th scope="col">Book</th>
                        <th scope="col">Details</th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="col">Id</th>
                            <td>${book.id}</td>
                        </tr>
                        <tr>
                            <th scope="col">Name</th>
                            <td>${book.name}</td>
                        </tr>
                        <tr>
                            <th scope="col">Price</th>
                            <td>Rs. ${book.price}</td>
                        </tr>
                        <tr>
                            <th scope="col">Edition</th>
                            <td>${book.edition}</td>
                        </tr>
                        <tr>
                            <th scope="col">File Name</th>
                            <td>${book.fileName}</td>
                        </tr>
                        <tr>
                            <th scope="col">File Type</th>
                            <td>${book.fileType}</td>
                        </tr>
                        <tr>
                            <th scope="col">Image</th>
                            <td><img src="data:image/jpeg;base64,${book.picture}" alt="${book.name}" width="200" height="300"/></td>
                        </tr>
                        <tr>
                            <th scope="col">Categories</th>
                            <td>
                                <c:forEach var="category" items="${book.categories}">
                                    ${category}
                                </c:forEach>
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">Authors</th>
                            <td>
                                <c:forEach var="author" items="${book.authors}">
                                    ${author}
                                </c:forEach>
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">Publishers</th>
                            <td>
                                <c:forEach var="publisher" items="${book.publishers}">
                                    ${publisher}
                                </c:forEach>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <a class="btn btn-outline-primary" href="/admin/book/edit/${book.id}"><i class='bx bxs-edit'></i> Edit</a>
            </div>
          </div>
        </div>
    </jsp:attribute>
</mt:admin>