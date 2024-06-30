<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Student Zone</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
    />
  </head>
  <body>
    <header class="fixed-top">
      <nav class="navbar navbar-expand-lg bg-body-tertiary p-0 mb-2">
        <div class="container-fluid" style="background-color: white">
          <a
            class="navbar-brand"
            href="#"
            style="margin-left: 5%; font-weight: 500; font-size: xx-large"
            >StudentZone</a
          >
          <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0" style="margin-left: 20%">
	            <li class="nav-item"><a href="index.jsp" class="nav-link active" aria-current="page">Home</a></li>
	            <li class="nav-item"><a href="about.jsp" class="nav-link active" aria-current="page">About</a></li>
	            <li class="nav-item"><a href="<c:url value='/student/assessment'/>" class="nav-link active" aria-current="page">Assessment</a></li>
	            <li class="nav-item"><a href="results.jsp" class="nav-link active" aria-current="page">Results</a></li>
	            <li class="nav-item"><a href="analyze.jsp" class="nav-link active" aria-current="page">Analyze</a></li>
	            <c:choose>
	                <c:when test="${not empty sessionScope.user}">
	                    <li class="nav-item"><a href="<c:url value='/logout'/>" class="nav-link active" aria-current="page">Logout</a></li>
	                </c:when>
	                <c:otherwise>
	                    <li class="nav-item"><a href="<c:url value='/login'/>" class="nav-link active" aria-current="page">Login</a></li>
	                    <li class="nav-item"><a href="<c:url value='/register'/>" class="nav-link active" aria-current="page">Register</a></li>
	                </c:otherwise>
	            </c:choose>
	          </ul>
            <c:choose>
	                <c:when test="${not empty sessionScope.user}">
	                    <div class="dropdown">
						  <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="border: none">
						  		<i class="bi bi-person-circle" 
	                    			style="font-size: 1.5rem;
	    							cursor: pointer;
	    							color: black;">
	    						</i>
						  </button>
						  <ul class="dropdown-menu">
						    <li><a class="dropdown-item" href="<c:url value='/student/profile'/>">Profile</a></li>
						    <li><a class="dropdown-item" href="#">Another action</a></li>
						  </ul>
						</div>   
	                </c:when>
	                <c:otherwise>
						<a class="btn-getstarted" href="<c:url value='/register'/>">Register</a>
	                </c:otherwise>
	        </c:choose>
          </div>
        </div>
      </nav>
    </header>
    <main style="background-color: #F3F7EC">
      <div class="container overflow-hidden">
        <div class="row gx-5" style="margin-top: 10%; margin-left: 3%">
          <div class="col-6 col-md-3">
            <div
              class="p-4"
              style="
                background-color: white;
                margin-bottom: 15%;
              "
            >
              <!-- Profile Section -->
              <div class="card-body">
                <h4>Personal details</h4>
                <div class="text-center mt-3">
                  <img
                    id="profile-photo"
                    src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQSwlI2jh42geitbgpoByIXfaR_2J9Dl3XJQ&s"
                    alt=""
                    class="rounded-circle"
                    width="100"
                    height="100"
                  />
                  <button
                    type="button"
                    class="btn btn-link p-0 btn-sm"
                    data-bs-toggle="modal"
                    data-bs-target="#profileModal"
                  >
                    <i class="bi bi-pencil"></i>
                  </button>
                  <h5 class="mt-2">${userDetails.fullName}</h5>
                  <button
                    class="btn btn-outline-primary mt-2"
                    style="margin-bottom: 5%"
                  >
                    <i class="bi bi-link-45deg"> </i> Share profile link
                  </button>
                  <button
                    class="btn btn-outline-primary mt-2"
                    style="margin-bottom: 5%"
                    data-bs-toggle="modal"
                    data-bs-target="#passwordModal"
                  >
                    <i class="bi bi-link-45deg"> </i> Change Password
                  </button>
                </div>
              </div>
              
              <!--Password Modal -->
            <div
                class="modal fade"
                id="passwordModal"
                tabindex="-1"
                aria-labelledby="passwordModalLabel"
                aria-hidden="true"
              >
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title">Change Password</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <form>
                        <div class="mb-1">
                            <label for="inputPassword1" class="form-label">Password:</label>
                            <input type="password" id="inputPassword1" class="form-control" aria-describedby="passwordHelpBlock">
                        </div>
                        <div class="mb-1">
                            <label for="inputPassword2" class="form-label">New Password:</label>
                            <input type="password" id="inputPassword2" class="form-control" aria-describedby="passwordHelpBlock">
                        </div>
                        <div class="mb-1">
                            <label for="inputPassword3" class="form-label">Re-enter new Password:</label>
                            <input type="password" id="inputPassword3" class="form-control" aria-describedby="passwordHelpBlock">
                        </div>

                        <div class="text-center mt-3">
                          <button type="submit" class="btn btn-primary">
                            Change Password
                          </button>
                        </div>
                      </form>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  </div>
                </div>
              </div>
            </div>

              <!--Profile Modal -->
              <div
                class="modal fade"
                id="profileModal"
                tabindex="-1"
                aria-labelledby="profileModalLabel"
                aria-hidden="true"
              >
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Profile Image</h5>
                      <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                      ></button>
                    </div>
                    <div class="modal-body">
                      <div class="card-body">
                        <div class="mt-2">
                          <h5
                            style="
                              text-align: left;
                              font-weight: 400;
                              font-size: large;
                            "
                          >
                            Add your profile image as you would like it to
                            appear on your profile.
                          </h5>
                          <img
                            id="modal-profile-photo"
                            src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQSwlI2jh42geitbgpoByIXfaR_2J9Dl3XJQ&s"
                            alt=""
                            class="rounded-circle"
                            width="100"
                            height="100"
                            style="margin-bottom: 4%"
                          />
                          <br />
                          <input
                            type="file"
                            id="photo-input"
                            class="d-none"
                            accept="image/*"
                          />

                          <button
                            class="btn btn-primary mt-2"
                            style="margin-bottom: 5%"
                            onclick="document.getElementById('photo-input').click();"
                          >
                            Change Photo
                          </button>
                          <button
                            class="btn btn-outline-primary mt-2"
                            style="margin-bottom: 5%"
                            onclick="removePhoto()"
                          >
                            Remove Photo
                          </button>
                        </div>
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button
                        type="button"
                        class="btn btn-secondary"
                        data-bs-dismiss="modal"
                      >
                        Close
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-12 col-md-8">
            <div
              class="p-3"
              style=" background-color: white"
            >
              <!-- Dynamic content here -->
              <div class="card">
                <div class="card-body">
                  <h2 class="card-title" style="text-align: center">
                    Details
                  </h2>
                  <div class="row p-2">
	                <div class="col-lg-3 col-md-4 label"><h6>Full Name:</h6></div>
	                <div class="col-lg-9 col-md-8">${userDetails.fullName}</div>
	              </div>
	              
	              <div class="row p-2">
	                <div class="col-lg-3 col-md-4 label"><h6>About:</h6></div>
	                <div class="col-lg-9 col-md-8">${userDetails.about}</div>
	              </div>
	              
	              <div class="row p-2">
	                <div class="col-lg-3 col-md-4 label"><h6>Country:</h6></div>
	                <div class="col-lg-9 col-md-8">${userDetails.country}</div>
	              </div>
	              
	              <div class="row p-2">
	                <div class="col-lg-3 col-md-4 label"><h6>Address:</h6></div>
	                <div class="col-lg-9 col-md-8">${userDetails.address}</div>
	              </div>
	              
	              <div class="row p-2">
	                <div class="col-lg-3 col-md-4 label"><h6>Phone:</h6></div>
	                <div class="col-lg-9 col-md-8">${userDetails.phone}</div>
	              </div>
	              
	              <div class="row p-2">
	                <div class="col-lg-3 col-md-4 label"><h6>Email:</h6></div>
	                <div class="col-lg-9 col-md-8">${userDetails.email}</div>
	              </div>
	              
	              <div class="row p-2">
	                <div class="col-lg-3 col-md-4 label"><h6>college:</h6></div>
	                <div class="col-lg-9 col-md-8">${userDetails.college}</div>
	              </div>
	              	              
                  <button
                    type="button"
                    class="btn btn-primary p-0 btn-sm"
                    data-bs-toggle="modal"
                    data-bs-target="#editDetailsModal"
                    style="margin-left:2%;margin-bottom:2%; width:80px; height:40px"
                    >
                    Edit
                  </button>
                </div>
              </div>

              <!--Edit Details Modal -->
              <div
                class="modal fade"
                id="editDetailsModal"
                tabindex="-1"
                aria-labelledby="editDetailsModalLabel"
                aria-hidden="true"
              >
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Edit Profile Details</h5>
                      <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                      ></button>
                    </div>
                    <div class="modal-body">
                      <form>
                      
                        <div class="mb-1">
                          <label for="inputName" class="form-label"
                            >Full Name:</label
                          >
                          <input
                            type="text"
                            id="inputName"
                            class="form-control"
                            aria-describedby="nameHelpBlock"
                            value="fullname"
                          />
                        </div>
                        
                        <div class="mb-1">
                          <label for="about" class="form-label"
                            >About:</label
                          >
                          <textarea
                              name="about"
                              class="form-control"
                              id="about"
                              style="height: 100px"
                            >${userDetails.about} </textarea
                            >
                        </div>
                        
                        <div class="mb-1">
                          <label for="inputCountry" class="form-label"
                            >Country:</label
                          >
                          <input
                            type="text"
                            id="inputCountry"
                            class="form-control"
                            aria-describedby="countryHelpBlock"
                            value="India"
                          />
                        </div>
                        
                        <div class="mb-1">
                          <label for="inputEmail" class="form-label"
                            >Email:</label
                          >
                          <input
                            type="email"
                            id="inputEmail"
                            class="form-control"
                            aria-describedby="emailHelpBlock"
                            value="example@example.com"
                          />
                        </div>
                        
                        <div class="mb-1">
                          <label for="inputPhone" class="form-label"
                            >Phone:</label
                          >
                          <input
                            type="text"
                            id="inputPhone"
                            class="form-control"
                            aria-describedby="phoneHelpBlock"
                            value="+91 1234567890"
                          />
                        </div>
                        
                        <div class="mb-1">
                          <label for="inputAddress" class="form-label"
                            >Address:</label
                          >
                          <input
                            type="text"
                            id="inputAddress"
                            class="form-control"
                            aria-describedby="addressHelpBlock"
                            value="Bhubaneswar, Odisha"
                          />
                        </div>
                        
                        <div class="mb-1">
                          <label for="inputClg" class="form-label"
                            >College/University:</label
                          >
                          <input
                            type="text"
                            id="inputClg"
                            class="form-control"
                            aria-describedby="clgHelpBlock"
                            value="Silicon University"
                          />
                        </div>
                        
                        <div class="text-center mt-3">
                          <button type="submit" class="btn btn-primary">
                            Save Changes
                          </button>
                        </div>
                      </form>
                    </div>
                    <div class="modal-footer">
                      <button
                        type="button"
                        class="btn btn-secondary"
                        data-bs-dismiss="modal"
                      >
                        Close
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              </div>
            <div
              class="p-3"
              style=" background-color: white; margin-top: 5%; margin-bottom: 10%"
            >
              <div class="card">
                <div class="card-body">
                  <h2 class="card-title" style="text-align: center">
                    Academic Details
                  </h2>
                  
                   <div class="row p-2">
	                <div class="col-lg-3 col-md-4 label"><h6>Degree:</h6></div>
	                <div class="col-lg-9 col-md-8">BTech</div>
	              </div>
	               <div class="row p-2">
	                <div class="col-lg-3 col-md-4 label"><h6>Semester:</h6></div>
	                <div class="col-lg-9 col-md-8">6</div>
	              </div>
	               <div class="row p-2">
	                <div class="col-lg-3 col-md-4 label"><h6>Branch:</h6></div>
	                <div class="col-lg-9 col-md-8">CSE</div>
	              </div>
	               <div class="row p-2">
	                <div class="col-lg-3 col-md-4 label"><h6>CGPA:</h6></div>
	                <div class="col-lg-9 col-md-8">8.59</div>
	              </div>
                  <button
                    type="button"
                    class="btn btn-primary p-0 btn-sm"
                    data-bs-toggle="modal"
                    data-bs-target="#editAcademicModal"
                    style="width:80px; height:40px"
                  >
                  	Edit
                  </button>
                </div>
              </div>

              <!--Edit Academic Details Modal -->
              <div
                class="modal fade"
                id="editAcademicModal"
                tabindex="-1"
                aria-labelledby="editAcademicModalLabel"
                aria-hidden="true"
              >
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Edit Academic Details</h5>
                      <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                      ></button>
                    </div>
                    <div class="modal-body">
                      <form>
                        <div class="mb-1">
                          <label for="inputDegree" class="form-label"
                            >Degree:</label
                          >
                          <input
                            type="text"
                            id="inputDegree"
                            class="form-control"
                            aria-describedby="degreeHelpBlock"
                            value="B.Tech in CSE"
                          />
                        </div>
                        <div class="mb-1">
                          <label for="inputUniversity" class="form-label"
                            >University:</label
                          >
                          <input
                            type="text"
                            id="inputUniversity"
                            class="form-control"
                            aria-describedby="universityHelpBlock"
                            value="Silicon University"
                          />
                        </div>
                        <div class="mb-1">
                          <label for="inputYear" class="form-label"
                            >Year:</label
                          >
                          <input
                            type="text"
                            id="inputYear"
                            class="form-control"
                            aria-describedby="yearHelpBlock"
                            value="2021 - 2025"
                          />
                        </div>
                        <div class="mb-1">
                          <label for="inputCGPA" class="form-label"
                            >CGPA:</label
                          >
                          <input
                            type="text"
                            id="inputCGPA"
                            class="form-control"
                            aria-describedby="cgpaHelpBlock"
                            value="8.59"
                          />
                        </div>
                        <div class="text-center mt-3">
                          <button type="submit" class="btn btn-primary">
                            Save Changes
                          </button>
                        </div>
                      </form>
                    </div>
                    <div class="modal-footer">
                      <button
                        type="button"
                        class="btn btn-secondary"
                        data-bs-dismiss="modal"
                      >
                        Close
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            </div>
          </div>
        </div>
      </div>
    </main>
    
      <!-- Footer Section -->
    <footer id="footer" class="footer position-relative" 
    style="   color:  #212529;
			  background-color:  #ffffff;
			  font-size: 14px;
			  padding-bottom: 50px;
			  position: relative;">
      <div class="container footer-top" style="padding-top: 50px;">
        <div class="row gy-4">
          <div class="col-lg-5 col-md-12 footer-about">
            <a href="index.html" class="logo d-flex align-items-center" style="margin-bottom: 25px;text-decoration: none;">
              <span class="sitename" 
              style="color: #32353a;;
					  font-size: 30px;
					  font-weight: 700;
					  letter-spacing: 1px;
					  font-family: sans-serif;
					  ">
              StudentZone</span>
            </a>
            <p style="font-size: 14px; font-family: sans-serif;">
              ExamPrep Portal is dedicated to helping students achieve their
              academic goals with high-quality resources and support.
            </p>

            <div class="social-links d-flex mt-4">
              <a href="" 
              style="display: flex;
				  align-items: center;
				  justify-content: center;
				  width: 40px;
				  height: 40px;
				  border-radius: 50%;
				  border: 1px solid #909294;
				  font-size: 16px;
				  color: #909294;
				  margin-right: 10px;
				  transition: 0.3s;">
				<i class="bi bi-twitter-x"></i></a>
              <a href=""
              style="display: flex;
				  align-items: center;
				  justify-content: center;
				  width: 40px;
				  height: 40px;
				  border-radius: 50%;
				  border: 1px solid #909294;
				  font-size: 16px;
				  color: #909294;
				  margin-right: 10px;
				  transition: 0.3s;">
              	<i class="bi bi-facebook"></i></a>
              <a href=""
              style="display: flex;
				  align-items: center;
				  justify-content: center;
				  width: 40px;
				  height: 40px;
				  border-radius: 50%;
				  border: 1px solid #909294;
				  font-size: 16px;
				  color: #909294;
				  margin-right: 10px;
				  transition: 0.3s;">
              	<i class="bi bi-instagram"></i></a>
              <a href=""
              style="display: flex;
				  align-items: center;
				  justify-content: center;
				  width: 40px;
				  height: 40px;
				  border-radius: 50%;
				  border: 1px solid #909294;
				  font-size: 16px;
				  color: #909294;
				  margin-right: 10px;
				  transition: 0.3s;">
              	<i class="bi bi-linkedin"></i></a>
            </div>
          </div>

          <div class="col-lg-2 col-6 footer-links" style="margin-bottom: 30px;">
            <h4 style="font-size: 16px;
				  font-weight: bold;
				  position: relative;
				  padding-bottom: 12px;">Useful Links</h4>
            <ul style="list-style: none;padding: 0;margin: 0;">
              <li style="padding: 10px 0;display: flex;align-items: center;"><a href="#" style="text-decoration: none; color: black">Home</a></li>
              <li style="padding: 10px 0;display: flex;align-items: center;"><a href="#" style="text-decoration: none; color: black">About us</a></li>
              <li style="padding: 10px 0;display: flex;align-items: center;"><a href="#" style="text-decoration: none; color: black">Services</a></li>
              <li style="padding: 10px 0;display: flex;align-items: center;"><a href="#" style="text-decoration: none; color: black">Terms of service</a></li>
              <li style="padding: 10px 0;display: flex;align-items: center;"><a href="#" style="text-decoration: none; color: black">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-2 col-6 footer-links" style="margin-bottom: 30px;">
            <h4 style="font-size: 16px;
				  font-weight: bold;
				  position: relative;
				  padding-bottom: 12px;">Our Services</h4>
            <ul style="list-style: none;padding: 0;margin: 0;">
              <li style="padding: 10px 0;display: flex;align-items: center;">
              	<a href="#" 
              	style="text-decoration: none; color: black;display: inline-block;line-height: 1;">
              	Web Design</a>
              </li>
              <li style="padding: 10px 0;display: flex;align-items: center;">
              	<a href="#"
              	style="text-decoration: none; color: black;display: inline-block;line-height: 1;">
              	Web Development</a>
              </li>
              <li style="padding: 10px 0;display: flex;align-items: center;">
              	<a href="#"
              	style="text-decoration: none; color: black;display: inline-block;line-height: 1;">
              	Product Management</a>
              </li>
              <li style="padding: 10px 0;display: flex;align-items: center;">
              	<a href="#"
              	style="text-decoration: none; color: black;display: inline-block;line-height: 1;">
              	Marketing</a>
              </li>
              <li style="padding: 10px 0;display: flex;align-items: center;">
              	<a href="#"
              	style="text-decoration: none; color: black;display: inline-block;line-height: 1;">
              	Graphic Design</a>
              </li>
            </ul>
          </div>

          <div
            class="col-lg-3 col-md-12 footer-contact text-center text-md-start"
          >
            <h4 style="font-size: 16px;
				  font-weight: bold;
				  position: relative;
				  padding-bottom: 12px;">Contact Us</h4>
            <p style="margin-bottom: 5px;">Silicon University</p>
            <p>Bhubaneswar, Odisha</p>
            <p>751010</p>
            <p class="mt-4">
              <strong>Phone:</strong> <span>+91 1234567809</span>
            </p>
            <p><strong>Email:</strong> <span>info@example.com</span></p>
          </div>
        </div>
      </div>

      <div class="container copyright text-center mt-2" 
      	style="padding-top: 25px;
		  padding-bottom: 25px;
  background-color: #babbba;">
        <p style="margin-bottom:0">
          � <span>Copyright</span> <strong class="sitename">StudentZone</strong>
          <span>All Rights Reserved</span>
        </p>
      </div>
    </footer>
    <!-- /Footer Section -->
    
    <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
      
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
      
    ></script>
    <script>
      document
        .getElementById("photo-input")
        .addEventListener("change", function (event) {
          var reader = new FileReader();
          reader.onload = function (e) {
            var imageUrl = e.target.result;
            document.getElementById("profile-photo").src = imageUrl;
            document.getElementById("modal-profile-photo").src = imageUrl;
          };
          if (event.target.files.length > 0) {
            reader.readAsDataURL(event.target.files[0]);
          }
        });

      function removePhoto() {
        document.getElementById("profile-photo").src = "";
        document.getElementById("modal-profile-photo").src = "";
        document.getElementById("photo-input").value = "";
      }
    </script>
  </body>
</html>
