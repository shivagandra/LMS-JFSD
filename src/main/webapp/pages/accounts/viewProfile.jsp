<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
  <div>
    <div class="card p-5" style="border-radius:10px;margin: 5rem;">
      <div class="row">
        <div class="col-lg-3 col-sm-12 m-2 text-center">
          <div class="d-flex justify-content-center m-2">
            <img src="data:image/jpeg;base64,${profile.profilePic}" class="rounded-circle m-3" width="150px" height="150px" />
          </div>
          <h3>${profile.appUser.firstName} ${profile.appUser.lastName}</h3>
          <h4 class="text-muted">( ${profile.appUser.email} )</h4>
        </div>
        <div class="col-lg-8 col-sm-12 m-2">
          <div class="card p-md-4 p-lg-5">
            <table class="table table-borderless">
              <tbody>
              <tr>
                <th>First Name</th>
                <td class="text-muted">${profile.appUser.firstName}</td>
              </tr>
              <tr>
                <th>Last Name</th>
                <td class="text-muted">${profile.appUser.lastName}</td>
              </tr>
              <tr>
                <th>Gender</th>
                <td class="text-muted">${profile.gender}</td>
              </tr>
              <tr>
                <th>Email</th>
                <td class="text-muted">${profile.appUser.email}</td>
              </tr>
              <tr>
                <th>Phone Number</th>
                <td class="text-muted">${profile.phoneNo}</td>
              </tr>
              <tr>
                <th>
                  <a class="btn btn-outline-primary mt-4" href="/accounts/profile/edit/${profile.id}">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                         class="bi bi-pencil-square" viewBox="0 0 18 20">
                      <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                      <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                    </svg> Edit
                  </a>
                  <a class="btn btn-outline-danger mt-4" href="/accounts/home">
                    Home
                  </a>
                </th>
              </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
