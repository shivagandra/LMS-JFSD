<%@ page contentType="text/html;charset=ISO-2022-JP" language="java" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<mt:admin title="View Publisher">
    <jsp:attribute name="content">
        <div class="p-4">
          <h1 class="">Manage</h1>
          <!-- Breadcrumb -->
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item active"><a href="/admin/publisher" class="text-decoration-none">Publisher</a></li>
              <li class="breadcrumb-item active" aria-current="page">View Publisher</li>
            </ol>
          </nav>
          <div>
            <div>
              <table class="table table-hover">
                <thead class="table-dark">
                <tr>
                  <th scope="col">Publisher</th>
                  <th scope="col">Details</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <th scope="col">Id</th>
                  <td>${publisher.id}</td>
                </tr>
                <tr>
                  <th scope="col">Name</th>
                  <td>${publisher.name}</td>
                </tr>
                <tr>
                  <th scope="col">Address</th>
                  <td>${publisher.address}</td>
                </tr>
<%--                <tr>--%>
<%--                  <th scope="col">Books</th>--%>
<%--                  <td>--%>
<%--                    <c:forEach var="book" items="${publisher.books}">--%>
<%--                      ${book}--%>
<%--                    </c:forEach>--%>
<%--                  </td>--%>
<%--                </tr>--%>
                </tbody>
              </table>
              <a class="btn btn-outline-primary" href="/admin/publisher/edit/${publisher.id}"><i class='bx bxs-edit'></i> Edit</a>
            </div>
          </div>
        </div>
    </jsp:attribute>
</mt:admin>