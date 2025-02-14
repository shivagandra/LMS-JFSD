<%@ page contentType="text/html;charset=ISO-2022-JP" language="java" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<mt:admin title="Edit Account">
    <jsp:attribute name="content">
        <div class="p-4">
          <h1 class="">Account</h1>
          <!-- Breadcrumb -->
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item active"><a href="/admin/accounts" class="text-decoration-none">Account</a></li>
              <li class="breadcrumb-item active"><a href="/admin/accounts/${book.id}"
                                                    class="text-decoration-none">View Account</a></li>
              <li class="breadcrumb-item active" aria-current="page">Edit Account</li>
            </ol>
          </nav>
          <div>
            <div class="container">
              <form action="/admin/accounts/edit" method="post" enctype="multipart/form-data">
                <div class="form-group mb-3">
                  <label for="id">Id</label>
                  <input type="number" class="form-control" id="id" name="id" value="${account.id}" readonly>
                </div>
                <div class="form-group mb-3">
                  <label for="firstName">First Name</label>
                  <input type="text" class="form-control" id="firstName" name="firstName" value="${account.firstName}">
                </div>
                <div class="form-group mb-3">
                  <label for="lastName">Last Name</label>
                  <input type="text" class="form-control" id="lastName" name="lastName" value="${account.lastName}">
                </div>
                <div class="form-group mb-3">
                  <label for="email">Email</label>
                  <input type="email" class="form-control" id="email" name="email" value="${account.email}">
                </div>
                <div class="form-group mb-5">
                  <label for="role">Role</label>
                  <select class="form-control" id="appUserRole" name="appUserRole">
                    <c:forEach var="role" items="${roles}">
                      <option value="${role}">${role}</option>
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