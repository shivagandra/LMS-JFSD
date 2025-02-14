<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Edit Profile</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
<div>
  <div class="container mt-5">
    <div class="card p-5" style="border-radius:10px;">
      <div class="d-flex justify-content-between mb-4">
        <h1>Edit Profile</h1>
        <a href="/accounts/profile/${profile.id}" class="btn btn-danger mb-3">Close</a>
      </div>
      <form action="/accounts/profile/edit/${profile.id}" method="post" enctype="multipart/form-data">
        <div class="form-group mb-3">
          <label for="id">Id</label>
          <input type="number" class="form-control" id="id" name="appUser" value="${profile.id}" readonly/>
        </div>
        <div class="form-group mb-3">
          <label for="appUser">User</label>
          <input class="form-control" id="appUser" name="appUser" value="${profile.appUser}" readonly/>
        </div>
        <div class="form-group mb-3">
          <label for="gender">Gender</label>
          <select class="form-control" id="gender" name="gender" value="${profile.gender}" required>
            <option value="Male" selected>Male</option>
            <option value="Female">Female</option>
          </select>
        </div>
        <div class="form-group mb-3">
          <label for="profilePic">Picture</label>
          <input type="file" class="form-control" id="profilePic" name="profilePic" value="${profile.profilePic}" required>
        </div>
        <div class="form-group mb-3">
          <label for="phoneNo">Phone Number</label>
          <input type="number" class="form-control" id="phoneNo" name="phoneNo" value="${profile.phoneNo}" required>
        </div>
        <input type="submit" class="btn btn-success" value="Update" />
      </form>
    </div>
  </div>
</div>
</body>
</html>
