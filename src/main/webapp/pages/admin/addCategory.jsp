<%@ page contentType="text/html;charset=ISO-2022-JP" language="java" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<mt:admin title="Add Category">
    <jsp:attribute name="content">
        <div class="p-4">
          <h1 class="">Manage</h1>
          <!-- Breadcrumb -->
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item active"><a href="/admin/category" class="text-decoration-none">Category</a></li>
              <li class="breadcrumb-item active" aria-current="page">Add Category</li>
            </ol>
          </nav>
          <div>
            <div class="container">
              <form action="/admin/category/addCategory" method="post">
                <div class="form-group mb-3">
                  <label for="name">Name</label>
                  <input type="text" class="form-control" id="name" name="name">
                </div>
                <input type="submit" class="btn btn-success" value="Add" />
              </form>
            </div>
          </div>
        </div>
    </jsp:attribute>
</mt:admin>