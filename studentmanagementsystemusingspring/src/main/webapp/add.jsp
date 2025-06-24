<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title><s:property
		value="student.studentId > 0 ? 'Edit Student' : 'Add Student'" /></title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
<!-- Bootstrap 5 Icons CDN (if needed) -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">
<style>
.container {
	margin: 20px;
	max-width: 1200px;
}

.errorMessage {
	color: red;
}

.successMessage {
	color: green;
}
</style>
<style>
.container {
	margin: 20px;
	max-width: 1200px;
}

.ui-jqgrid {
	width: 100% !important;
	border-collapse: collapse;
}

.ui-jqgrid-view {
	width: 100% !important;
}

.ui-jqgrid-hdiv, .ui-jqgrid-bdiv {
	width: 100% !important;
}

.ui-jqgrid tr.jqgrow td {
	padding: 6px 8px;
	border: 1px solid #ddd;
}

.ui-jqgrid .ui-jqgrid-htable th {
	background-color: #e9ecef;
	padding: 8px;
	border: 1px solid #ddd;
	font-weight: bold;
}

.ui-jqgrid .ui-jqgrid-pager {
	background-color: #e9ecef;
	border-top: 1px solid #ddd;
}

.ui-jqgrid tr.jqgrow {
	background-color: #fff;
}

.ui-jqgrid tr.jqgrow:nth-child(even) {
	background-color: #f8f9fa;
}

.action-links a {
	margin-right: 5px;
	color: #007bff;
	text-decoration: none;
}

.action-links a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark px-3">
		<div class="collapse navbar-collapse" id="navbarMain">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" href="index.jsp">DEMO-US
				</a></li>
				<li class="nav-item dropdown"><button
						class="nav-link dropdown-toggle btn btn-link" id="exportDropdown"
						data-bs-toggle="dropdown" aria-expanded="false">Student
						Operations</button>

					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="searchStudent">Search
								Student</a></li>
						<li><a class="dropdown-item" href="addStudent">Add
								Student</a></li>

					</ul></li>



			</ul>

			<ul class="navbar-nav d-flex align-items-center gap-3">
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fa-solid fa-house-chimney mr-5"></i></a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fa-solid fa-gauge mr-5"></i></a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fa-solid fa-bell mr-5"></i></a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"><i
						class="fa-solid fa-wrench mr-5"><ul class="dropdown-menu"></ul></i></a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"><i
						class="fa-solid fa-star mr-5"><ul class="dropdown-menu"></ul></i></a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"><i
						class="fa-solid fa-circle-question mr-5"><ul
								class="dropdown-menu"></ul></i></a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"><i
						class="fa-solid fa-book mr-5"><ul class="dropdown-menu"></ul></i></a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fa-solid fa-envelope mr-5"></i></a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fa-solid fa-arrow-right-from-bracket mr-5"></i></a></li>
			</ul>
		</div>
	</nav>
	<div class="container mt-2 bg-light">
		<div class="container-fluid p-3 bg-light text-center">
			<h2>
				<s:property
					value="student.studentId > 0 ? 'Edit Student' : 'Add Student'" />
			</h2>
		</div>
		<div id="alertContainer"></div>
		<div class="container mt-5 bg-light">
			<s:form action="save" cssClass="row g-3 needs-validation"
				method="post" theme="simple">
				<div class="mb-3 text-left">
					<s:submit name="actionType" value="Save" cssClass="btn btn-primary" />
					<s:submit name="actionType" value="Save and Return"
						cssClass="btn btn-primary" />
					<a href="search" class="btn btn-secondary">Back</a>
				</div>

				<s:hidden name="fromPage" value="%{fromPage}" />
				<s:hidden name="studentId" />

				<div class="mb-3">
					<div class="row align-items-center">
						<div class="col-md-3">
							<label for="name" class="form-label text-md-end">Name:</label>
						</div>
						<div class="col-md-8">
							<s:textfield name="name" id="name" placeholder="Enter Name"
								cssClass="form-control" maxlength="100" />
						</div>
					</div>
				</div>

				<div class="mb-3">
					<div class="row align-items-center">
						<div class="col-md-3">
							<label for="department" class="form-label text-md-end">Department:</label>
						</div>
						<div class="col-md-8">
							<s:if test="departmentList != null">
								<s:select name="student.department" id="department"
									list="departmentList" cssClass="form-select" />
							</s:if>
							<s:else>
								<select name="student.department" id="department"
									class="form-select" disabled>
									<option value="">Error loading departments</option>
								</select>
							</s:else>
							<s:fielderror fieldName="student.department"
								cssClass="errorMessage" />
						</div>
					</div>
				</div>


				<div class="mb-3">
					<div class="row align-items-center">
						<div class="col-md-3">
							<label for="dob" class="form-label">Date of Birth:</label>
							<fmt:formatDate value="${student.dob}" pattern="yyyy-MM-dd"
								var="formattedDob" />
						</div>
						<div class="col-md-8">
							<input type="date" id="dob" name="dob" value="${formattedDob}"
								class="form-control" required />
						</div>
					</div>
				</div>

				<div class="mb-3">
					<div class="row align-items-center">
						<div class="col-md-3">
							<label for="doa" class="form-label">Date of Admission:</label>
							<fmt:formatDate value="${student.doa}" pattern="yyyy-MM-dd"
								var="formattedDoa" />
						</div>
						<div class="col-md-8">
							<input type="date" id="doa" name="doa" value="${formattedDoa}"
								class="form-control" required />
						</div>
					</div>
				</div>
<div class="mb-3">
                    <div class="row align-items-start">
                        <div class="col-md-3">
                            <label class="form-label text-md-end">Gender:</label>
                        </div>
                        <div class="col-md-8">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="student.gender" id="genderMale" value="Male" <s:if test="student.gender == 'Male'">checked</s:if>/>
                                <label class="form-check-label" for="genderMale">Male</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="student.gender" id="genderFemale" value="Female" <s:if test="student.gender == 'Female'">checked</s:if>/>
                                <label class="form-check-label" for="genderFemale">Female</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="student.gender" id="genderOther" value="Other" <s:if test="student.gender == 'Other'">checked</s:if>/>
                                <label class="form-check-label" for="genderOther">Other</label>
                            </div>
                            <s:fielderror fieldName="student.gender" cssClass="errorMessage"/>
                        </div>
                    </div>
                </div>

			<!-- 	<div class="mb-3">
					<div class="row align-items-start">
						<div class="col-md-3">
							<label for="genderMale" class="form-label text-md-end">Gender:</label>
						</div>
						<div class="col-md-8">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="student.gender"
									id="genderMale" value="Male" />
									 <label
									class="form-check-label" for="genderMale">Male</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="student.gender"
									id="genderFemale" value="Female" /> <label
									class="form-check-label" for="genderFemale">Female</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="student.gender"
									id="genderOther" value="Other" /> <label
									class="form-check-label" for="genderOther">Other</label>
							</div>
						</div>
					</div>
				</div> -->

				<div class="mb-3">
					<div class="row align-items-start">
						<div class="col-md-3">
							<label for="address" class="form-label text-md-end">Address:</label>
						</div>
						<div class="col-md-8">
							<s:textarea name="address" id="address" rows="4"
								cssClass="form-control" />
						</div>
					</div>
				</div>

				<s:actionerror cssClass="text-danger" />
			</s:form>
		</div>
	</div>



	<script>
	
	  if (student.studentId > 0) {
	        alertContainer.innerHTML = `
	          <div class="alert alert-danger alert-dismissible fade show" role="alert">
	        	 <strong>Success!</strong> Student Data Updated successfully.
	            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	          </div>`;
	      } else {
	        alertContainer.innerHTML = `
	          <div class="alert alert-success alert-dismissible fade show" role="alert">
	            <strong>Success!</strong> Form submitted successfully.
	            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	          </div>`;
	      }
	
	
		document
				.querySelectorAll('.dropdown-menu a[data-bs-toggle="collapse"]')
				.forEach(function(element) {
					element.addEventListener('click', function(e) {
						e.stopPropagation();
					});
				});
		document
				.querySelector('#ordersDeliveriesSubmenu')
				.addEventListener(
						'show.bs.collapse',
						function() {
							const icon = document
									.querySelector('#ordersDeliveriesSubmenu').previousElementSibling
									.querySelector('.plus-icon');
							icon.classList.remove('fa-square-plus');
							icon.classList.add('fa-square-minus');
						});

		document
				.querySelector('#ordersDeliveriesSubmenu')
				.addEventListener(
						'hide.bs.collapse',
						function() {
							const icon = document
									.querySelector('#ordersDeliveriesSubmenu').previousElementSibling
									.querySelector('.plus-icon');
							icon.classList.remove('fa-square-minus');
							icon.classList.add('fa-square-plus');
						});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
