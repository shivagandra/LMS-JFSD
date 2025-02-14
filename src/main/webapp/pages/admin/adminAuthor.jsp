<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<mt:admin title="Manage">
    <jsp:attribute name="content">
        <div class="p-4">
          <h1 class="">Manage</h1>
          <!-- Breadcrumb -->
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item active" aria-current="page">Author</li>
            </ol>
          </nav>
          <c:if test="${not empty error}">
             <div class="alert alert-danger alert-dismissible fade show" role="alert">
                 ${error}
               <button type="button" class="btn-close" data-dismiss="alert" aria-label="Close">
                 <span aria-hidden="true"></span>
               </button>
             </div>
            </c:if>
          <c:if test="${not empty msg}">
             <div class="alert alert-success alert-dismissible fade show" role="alert">
                 ${msg}
               <button type="button" class="btn-close" data-dismiss="alert" aria-label="Close">
                 <span aria-hidden="true"></span>
               </button>
             </div>
            </c:if>
          <div>
            <div class="d-flex justify-content-between">
              <h2>Authors</h2>
              <a class="btn btn-outline-primary mb-2" href="/admin/author/addAuthor">Add Author</a>
            </div>
            <table class="table table-hover">
              <thead class="table-dark">
              <tr>
                <th scope="col">#</th>
                <th scope="col">First Name</th>
                <th scope="col">Last Name</th>
                <th scope="col">Email</th>
                <th scope="col">View</th>
                <th scope="col">Update</th>
                <th scope="col">Delete</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach var="author" items='${authors}'>
                    <tr>
                      <th scope="row">${author.id}</th>
                      <td>${author.firstName}</td>
                      <td>${author.lastName}</td>
                      <td>${author.email}</td>
                      <td><a class="btn btn-outline-dark" href="/admin/author/${author.id}">View</a></td>
                      <td><a class="btn btn-outline-success" href="/admin/author/edit/${author.id}">Update</a></td>
                      <td><a class="btn btn-outline-danger" href="/admin/author/delete/${author.id}">Delete</a></td>
                    </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
    </jsp:attribute>
</mt:admin>