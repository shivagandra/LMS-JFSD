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
              <li class="breadcrumb-item active"><a href="/admin/accounts" class="text-decoration-none">Account</a></li>
              <li class="breadcrumb-item active" aria-current="page">View Accounts</li>
            </ol>
          </nav>
          <div>
            <div>
              <table class="table table-hover">
                <thead class="table-dark">
                <tr>
                  <th scope="col">Aaccount</th>
                  <th scope="col">Details</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <th scope="col">Id</th>
                  <td>${account.id}</td>
                </tr>
                <tr>
                  <th scope="col">First Name</th>
                  <td>${account.firstName}</td>
                </tr>
                <tr>
                  <th scope="col">Last Name</th>
                  <td>${account.lastName}</td>
                </tr>
                <tr>
                  <th scope="col">Email</th>
                  <td>${account.email}</td>
                </tr>
                <tr>
                  <th scope="col">Role</th>
                  <td>${account.appUserRole}</td>
                </tr>
                <tr>
                  <th scope="col">Is locked</th>
                  <td>${account.locked}</td>
                </tr>
                </tbody>
              </table>
              <a class="btn btn-outline-primary" href="/admin/accounts/edit/${account.id}"><i class='bx bxs-edit'></i> Edit</a>
            </div>
          </div>
        </div>
    </jsp:attribute>
</mt:admin>