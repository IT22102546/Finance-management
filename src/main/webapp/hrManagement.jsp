<%@page import="java.util.List"%>
<%@page import="com.letslearn.DBcon.DbCon"%>
<%@page import="com.letslearn.Dao.*"%>
<%@page import="java.util.*"%>
<%@page import="com.letslearn.Modal.*"%>
<%@ page import="com.letslearn.Dao.HrDao" %>


<!DOCTYPE html>
<html lang="en">



<%
HrDao hrDao = new HrDao(DbCon.getConnection());
List<Hr> hrs = hrDao.getAllHrs();

%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/bootstrap.css">

<link rel="stylesheet" href="assets/vendors/iconly/bold.css">
<link rel="stylesheet" href="assets/vendors/simple-datatables/style.css">

<link rel="stylesheet"
	href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet"
	href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="assets/css/app.css">
<link rel="shortcut icon" href="assets/images/favicon.svg"
	type="image/x-icon">
</head>

<body>
	<div id="app">
		<div id="sidebar" class="active">
			<div class="sidebar-wrapper active">
				<div class="sidebar-header px-0 pb-0">
					<div class="d-flex justify-content-between">
						<div>
							<img src="assets/images/logo/logo.png" class="h-100 w-100"
								alt="Logo" srcset="">
						</div>
						<div class="toggler">
							<a href="#" class="sidebar-hide d-xl-none d-block"><i
								class="bi bi-x bi-middle"></i></a>
						</div>
					</div>
				</div>
				<div class="sidebar-menu">
					<ul class="menu px-3">
						<li class="sidebar-title">Admin Dashboard</li>

						<li class="sidebar-item active "><a
							href="hrManagement.jsp" class='sidebar-link'> <i
								class="bi bi-grid-fill"></i> <span>HR Management</span>
						</a></li>
						<li class="sidebar-item  "><a href="payrollManagement.jsp"
							class='sidebar-link'> <i class="bi bi-grid-1x2-fill"></i> <span>Payroll
									Management</span>
						</a></li>

						<li class="sidebar-item  "><a href="welfareManagement.jsp"
							class='sidebar-link'> <i
								class="bi bi-file-earmark-spreadsheet-fill"></i> <span>Customer
									Management</span>
						</a></li>
						<li class="sidebar-item "><a
							href="adminManagement.jsp" class='sidebar-link'> <i
								class="bi bi-grid-fill"></i> <span>Admin
									Management</span>
						</a></li>
						<li class="sidebar-title">Profile</li>

						<li class="sidebar-item  "><a href="LogoutServlet"
							class='sidebar-link'> <i class="bi bi-life-preserver"></i> <span>Logout</span>
						</a></li>
					</ul>
				</div>
				<button class="sidebar-toggler btn x">
					<i data-feather="x"></i>
				</button>
			</div>
		</div>
		<div id="main">
			<header class="mb-3">
				<a href="#" class="burger-btn d-block d-xl-none"> <i
					class="bi bi-justify fs-3"></i>
				</a>
			</header>

			<div class="page-heading">
				<h3>HR Management</h3>
			</div>
			<section class="section">
				<div class="card">
					<div class="card-header d-flex justify-content-between">
						<h4>HR List</h4>
						<div>
							<button class="btn btn-primary" data-bs-toggle="modal"
								data-bs-target="#staticBackdrop">Add HR</button>
						</div>
					</div>
					<div class="card-body">
						<table class="table table-hover" id="table1">
							<thead>
								<tr>
									<th>Name</th>
									<th>Email</th>
									<th>Phone</th>
									<th>City</th>
									<th>NIC</th>
									<th>HR Grade</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
								<%
								for (Hr hr : hrs) {
								%>
								<tr>
									<td><%=hr.getName()%></td>
									<td><%=hr.getEmail()%></td>
									<td><%=hr.getTel()%></td>
									<td><%=hr.getCity()%></td>
									<td><%=hr.getNic()%></td>
									<td><%=hr.getGrade()%></td>
									<td><a
										href="HrServlet?action=delete&email=<%=hr.getEmail()%>"><span
											class="badge bg-danger py-2" style="cursor: pointer;">Delete</span>
									</a> 
									<a href="#" class="edit-link" data-bs-toggle="modal"
										data-bs-target="#updateStaticBackdrop"
										data-hr-name="<%=hr.getName()%>"
										data-hr-email="<%=hr.getEmail()%>"
										data-hr-tel="<%=hr.getTel()%>"
										data-hr-city="<%=hr.getCity()%>"
										data-hr-nic="<%=hr.getNic()%>"
										data-hr-grade="<%=hr.getGrade()%>"> <span
											class="badge bg-warning py-2" style="cursor: pointer;">Edit</span>
									</a>
									</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</section>

			<!-- update Modal -->
			<div class="modal fade" id="updateStaticBackdrop"
				data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="updateStaticBackdrop">Edit
								Hr</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form class="row g-3 needs-validation" action="HrServlet"
								method="POST">
								<input type="hidden" value="update" name="action" />
								<div class="row">
									<div class="col-md-12 position-relative">
										<label for="validationTooltip01" class="form-label">Name</label>
										<input type="text" class="form-control" name="fname"
											id="fname" required>

									</div>

									<div class="col-md-6 position-relative d-none">
										<label for="validationTooltipUsername" class="form-label">Email</label>
										<div class="input-group has-validation">
											<input type="email" class="form-control" name="email"
												title="Enter Email" id="email">

										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 position-relative">
										<label for="validationTooltip03" class="form-label">City</label>
										<input type="text" class="form-control" name="city" id="city"
											title="Enter City" required>

									</div>
									<div class="col-md-6 position-relative">
										<label for="validationTooltip05" class="form-label">NIC</label>
										<input pattern="^\d{12}$" maxlength="12" name="nic" id="nic"
											type="text" class="form-control" title="Enter NIC" required>

									</div>
								</div>

								<div class="row">
									<div class="col-md-6 position-relative">
										<label for="validationTooltip04" class="form-label">Grade</label>
										<select class="form-select" name="grade" id="grade" required>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
										</select>
										<div class="invalid-tooltip">Please select a valid
											HR Grade.</div>
									</div>
									<div class="col-md-6 position-relative">
										<label for="validationTooltip06" class="form-label">Telephone</label>
										<input type="text" class="form-control" id="tel"
											title="Enter Phone number" name="tel" required
											pattern="^\d{10}$" maxlength="10">

									</div>
								</div>


								<div class="mt-3 d-flex justify-content-end">
									<button type="button" class="btn btn-secondary mx-3"
										data-bs-dismiss="modal">Close</button>
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
				data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">Add New
								HR</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form class="row g-3 needs-validation" action="HrServlet"
								method="POST">
								<input type="hidden" value="addHr" name="action" />

								<div class="col-md-6 position-relative">
									<label for="validationTooltip01" class="form-label">Name</label>
									<input type="text" class="form-control" placeholder="Mark"
										name="fname" required>

								</div>

								<div class="col-md-6 position-relative">
									<label for="validationTooltipUsername" class="form-label">Email</label>
									<div class="input-group has-validation">
										<input type="email" class="form-control" name="email"
											title="Enter Email" required>

									</div>
								</div>
								<div class="col-md-6 position-relative">
									<label for="validationTooltip03" class="form-label">City</label>
									<input type="text" name="city" class="form-control"
										title="Enter City" required>

								</div>
								<div class="col-md-6 position-relative">
									<label for="validationTooltip05" class="form-label">NIC</label>
									<input type="text" name="nic" maxlength="12"
										class="form-control" title="Enter NIC" required
										pattern="^\d{12}$">

								</div>

								<div class="col-md-6 position-relative">
									<label for="validationTooltip04" class="form-label">Grade</label>
									<select class="form-select" name="grade" required>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select>
									<div class="invalid-tooltip">Please select a valid HR Grade.
									</div>
								</div>


								<div class="col-md-6 position-relative">
									<label for="validationTooltip06" class="form-label">Telephone</label>
									<input type="text" class="form-control" name="tel"
										title="Enter Phone number" required pattern="^\d{10}$"
										maxlength="10">

								</div>

								<div class="d-flex justify-content-end">
									<button type="button" class="btn btn-secondary mx-3"
										data-bs-dismiss="modal">Close</button>
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

			
		</div>
	</div>
	<script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendors/simple-datatables/simple-datatables.js"></script>

	<script>
		// Simple Datatable
		let table1 = document.querySelector('#table1');
		let dataTable = new simpleDatatables.DataTable(table1);
		
	</script>
	<script src="assets/js/main.js"></script>
	<script>
    // JavaScript to update modal content when "Edit" link is clicked
    document.querySelectorAll('.edit-link').forEach(link => {
        link.addEventListener('click', function () {
            const modal = document.getElementById('updateStaticBackdrop');
            const nameInput = document.getElementById('fname');
            const emailInput = document.getElementById('email'); // Assuming you have an element with the ID 'email'
            const cityInput = document.getElementById('city');
            const nicInput = document.getElementById('nic');
            const gradeInput = document.getElementById('grade');
            const telInput = document.getElementById('tel');

            // Get the data from the attributes
            const sellerName = link.getAttribute('data-hr-name');
            const sellerEmail = link.getAttribute('data-hr-email');
            const sellerCity = link.getAttribute('data-hr-city');
            const sellerNic = link.getAttribute('data-hr-nic');
            const sellerGrade = link.getAttribute('data-hr-grade');
            const sellerTel = link.getAttribute('data-hr-tel');

            // Update the modal input fields with the data
            nameInput.value = sellerName;
            emailInput.value = sellerEmail;
            cityInput.value = sellerCity;
            nicInput.value = sellerNic;
            gradeInput.value = sellerGrade;
            telInput.value = sellerTel;
        });
    });
</script>

</body>

</html>