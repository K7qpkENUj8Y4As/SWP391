<%-- 
    Document   : AccountManagementPage
    Created on : Apr 17, 2025, 9:52:05 AM
    Author     : trung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Customer Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .table-rounded {
            border-collapse: separate;
            border-spacing: 0;
            border: 1px solid #dee2e6;
            border-radius: 12px;
            overflow: hidden;
        }

        .table-rounded th:first-child {
            border-top-left-radius: 12px;
        }

        .table-rounded th:last-child {
            border-top-right-radius: 12px;
        }

        .table-rounded tr:last-child td:first-child {
            border-bottom-left-radius: 12px;
        }

        .table-rounded tr:last-child td:last-child {
            border-bottom-right-radius: 12px;
        }

        .pagination-rounded .page-link {
            border-radius: 50% !important;
            width: 40px;
            height: 40px;
            padding: 0;
            line-height: 40px;
            text-align: center;
            color: #000;
            background-color: transparent;
            border: none;
        }

        .pagination-rounded .page-item.active .page-link {
            background-color: #f2f2f2 !important;
            font-weight: bold;
        }

        .pagination-rounded .page-link:hover {
            background-color: #eee;
        }

        .sort-btn {
            cursor: pointer;
        }

        .custom-th {
            background-color: #ffeee8 !important;
        }
    </style>
</head>

<body>
    <!-- Page Content -->
    <div class="container my-5">
        <h2 class="fw-bold mb-4">ACCOUNT</h2>
        <!-- Search and Filter -->
        <div class="row mb-3">
            <div class="col-md-6">
                <input type="text" id="searchInput" class="form-control" placeholder="Search by username...">
            </div>
            <div class="col-md-3">
                <select id="roleFilter" class="form-select">
                    <option value="">All Roles</option>
                    <option value="Manager">Manager</option>
                    <option value="Customer">Customer</option>
                    <option value="Staff">Staff</option>
                </select>
            </div>
            <div class="col-md-3"><button class="btn btn-outline-success w-100" data-bs-toggle="modal" data-bs-target="#addManagerModal">AddManager</button></div>      
        </div>
        <!-- Table -->
        <div class="table-responsive">
            <table class="table table-bordered text-center table-rounded">
                <thead>
                    <tr>
                        <th class="custom-th sort-btn" onclick="sortTable(0)">Customer ID</th>
                        <th class="custom-th sort-btn" onclick="sortTable(1)">Username</th>
                        <th class="custom-th sort-btn" onclick="sortTable(2)">Role</th>
                        <th class="custom-th">Password</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Henry32</td>
                        <td>Manager</td>
                        <td>123456789</td>
                    </tr>
                        <td>2</td>
                        <td>Lois12</td>
                        <td>Staff</td>
                        <td>12345678</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Heinz34</td>
                        <td>Customer</td>
                        <td>12345678</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>Masney14</td>
                        <td>Customer</td>
                        <td>12345678</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
     <!--Pagination-->
    <nav aria-label="Page navigation" class="d-flex justify-content-center mt-4">
        <ul class="pagination pagination-rounded">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">&lt;</a>
            </li>
            <li class="page-item active" aria-current="page">
                <a class="page-link" href="#">1</a>
            </li>
            <li class="page-item" >
                <a class="page-link" href="#">2</a>
            </li>
            <li class="page-item">
                <a class="page-link" href="#">&gt;</a>
            </li>
        </ul>
    </nav>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <!--Modal-->
    <div class="modal fade" id="addManagerModal" tabindex="-1" aria-labelledby="addManagerModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content rounded-4">
                <div class="modal-header bg-success text-white">
                    <h5 class="modal-title" id="addManagerModalLabel">Add New Manager</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="addManagerForm">
                        <div class="mb-3">
                            <label for="managerUsername" class="form-label">Username</label>
                            <input type="text" class="form-control" id="managerUsername" required>
                        </div>
                        <div class="mb-3">
                            <label for="managerPassword" class="form-label">Password</label>
                            <input type="password" class="form-control" id="managerPassword" required>
                        </div>
                        <button type="submit" class="btn btn-success w-100">Add Manager</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    const searchInput = document.getElementById("searchInput");
    const roleFilter = document.getElementById("roleFilter");
    const table = document.querySelector("table tbody");

    searchInput.addEventListener("input", filterTable);
    roleFilter.addEventListener("change", filterTable);

    function filterTable() {
    const searchText = searchInput.value.toLowerCase();
    const selectedRole = roleFilter.value.toLowerCase();
    const rows = table.querySelectorAll("tr");

    rows.forEach(row => {
        const username = row.children[1].textContent.toLowerCase();
        const role = row.children[2].textContent.toLowerCase();
        const matchSearch = username.includes(searchText);
        const matchRole = !selectedRole || role === selectedRole;
        row.style.display = (matchSearch && matchRole) ? "" : "none";
    });
}


    function sortTable(columnIndex) {
        const rows = Array.from(table.querySelectorAll("tr"));
        const ascending = table.getAttribute("data-sort") !== "asc";

        rows.sort((a, b) => {
            const valA = a.children[columnIndex].textContent.trim().toLowerCase();
            const valB = b.children[columnIndex].textContent.trim().toLowerCase();
            return ascending ? valA.localeCompare(valB) : valB.localeCompare(valA);
        });

        rows.forEach(row => table.appendChild(row));
        table.setAttribute("data-sort", ascending ? "asc" : "desc");
    }
</script>

</html>
