<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Student Search</title>
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
	<div class="container-fluid mt-3 bg-light">
		<div class="container mt-3">
			<div class="row">
				<div class="col-sm-6 left">
					<h2>
						<i class="fa-solid fa-network-wired mr-5"></i> Student Management System
					</h2>
				</div>
				<div class="col-sm-6 center text-center">
					<span class="badge rounded-pill bg-success"
						style="font-size: 20px;">1234567890</span> <span
						class="badge rounded-pill bg-success" style="font-size: 20px;">1234567890</span>
				</div>
			</div>
		</div>
		<div class="container mt-3">
			<div class="row">
				<hr class="border border-dark border-2" style="color: black;">
			</div>
		</div>
	</div>




	<script>
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
