<%@ page contentType="text/html;charset=ISO-2022-JP" language="java" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<mt:admin title="View Author">
    <jsp:attribute name="content">
        <div class="p-4">
          <h1 class="">Manage</h1>
          <!-- Breadcrumb -->
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item active"><a href="/admin/author" class="text-decoration-none">Author</a></li>
              <li class="breadcrumb-item active" aria-current="page">View Author</li>
            </ol>
          </nav>
          <div>
            <div>
              <c:set var="author" value="${author}" />
              <table class="table table-hover">
                <thead class="table-dark">
                <tr>
                  <th scope="col">Author</th>
                  <th scope="col">Details</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <th scope="col">Id</th>
                  <td>${author.id}</td>
                </tr>
                <tr>
                  <th scope="col">First Name</th>
                  <td>${author.firstName}</td>
                </tr>
                <tr>
                  <th scope="col">Last Name</th>
                  <td>${author.lastName}</td>
                </tr>
                <tr>
                  <th scope="col">Email</th>
                  <td>${author.email}</td>
                </tr>
<%--                <tr>--%>
<%--                  <th scope="col">Books</th>--%>
<%--                  <td>--%>
<%--                    <c:forEach var="book" items="${author.books}">--%>
<%--                      ${book}--%>
<%--                    </c:forEach>--%>
<%--                  </td>--%>
<%--                </tr>--%>
                </tbody>
              </table>
              <a class="btn btn-outline-primary" href="/admin/author/edit/${author.id}"><i class='bx bxs-edit'></i> Edit</a>
            </div>
          </div>
        </div>
    </jsp:attribute>
</mt:admin>