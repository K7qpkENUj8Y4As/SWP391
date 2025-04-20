<%-- 
    Document   : RawManagementPage
    Created on : Apr 18, 2025, 11:11:50 PM
    Author     : trung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <title>Raw Management</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
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

            img.flower-img {
                max-width: 100px;
                height: auto;
            }
        </style>
    </head>

    <body>
        <div class="container my-5">
            <h2 class="fw-bold mb-4">Manager Flower</h2>
            <!-- Search and Filters -->
            <div class="row mb-3">
                <!-- Search -->
                <div class="col-md-4 mb-2">
                    <input type="text" id="searchInput" class="form-control" placeholder="Search by flower name..." />
                </div>

                <!-- Status -->
                <div class="col-md-4 mb-2">
                    <select id="statusFilter" class="form-select">
                        <option value="">All Status</option>
                        <option value="In stock">In stock</option>
                        <option value="Out of stock">Out of stock</option>
                        <option value="Expired">Expired</option>
                    </select>
                </div>

                <!-- Create Flower Button -->
                <div class="col-md-4 mb-2 d-grid">
                    <button class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#createFlowerModal">
                        Create Flower
                    </button>
                </div>
            </div>

            <!-- Date Filters -->
            <div class="row mb-4">
                <!-- Import Date -->
                <div class="col-md-6">
                    <label for="createDate" class="form-label">Import Date (From):</label>
                    <input type="date" class="form-control" id="createDate" />
                </div>

                <!-- Expire Date -->
                <div class="col-md-6">
                    <label for="expireDate" class="form-label">Expire Date (To):</label>
                    <input type="date" class="form-control" id="expireDate" />
                </div>
            </div>

            <!-- Table -->
            <div class="table-responsive">
                <table class="table table-bordered text-center table-rounded">
                    <thead>
                        <tr>
                            <th class="custom-th sort-btn" onclick="sortTable(0)">Flower ID</th>
                            <th class="custom-th">Flower Image</th>
                            <th class="custom-th sort-btn" onclick="sortTable(2)">Flower Name</th>
                            <th class="custom-th sort-btn" onclick="sortTable(3)">Quantity</th>
                            <th class="custom-th sort-btn" onclick="sortTable(4)">Expire Date</th>
                            <th class="custom-th sort-btn" onclick="sortTable(5)">Import Date</th>
                            <th class="custom-th sort-btn" onclick="sortTable(6)">Status</th>
                            <th class="custom-th">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="flower" items="${flowerList}">
                        <tr>
                            <td>${flower.id}</td>
                            <td>
                                <img src="${flower.image}" alt="${flower.name}" class="flower-img" />
                            </td>
                            <td>${flower.name}</td>
                            <td>${flower.quantity}</td>
                            <td>${flower.expireDate}</td>
                            <td>${flower.importDate}</td>
                            <td>${flower.status}</td>
                            <td>
                                <div class="row">
                                    <div class="col-6">
                                        <form action="DeleteRaw" method="get" >
                                            <button class="btn btn-outline-danger w-100 mb-1">Delete</button>   
                                        </form>   
                                    </div>
                                    <div class="col-6">
                                        <button type="button" class="btn btn-outline-primary w-100 mb-1"
                                                data-bs-toggle="modal"
                                                data-bs-target="#updateFlowerModal"
                                                data-id="${flower.id}"
                                                data-name="${flower.name}"
                                                data-quantity="${flower.quantity}"
                                                data-image="${flower.image}"
                                                data-expire="${flower.expireDate}"
                                                data-import="${flower.importDate}"
                                                data-status="${flower.status}">
                                            Update
                                        </button>

                                    </div>
                                </div>
                                <button class="btn btn-outline-warning w-100" style="max-width: 140px;margin-top: 5px;">View Detail</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            <!--            <nav aria-label="Page navigation" class="d-flex justify-content-center mt-4">
                            <ul class="pagination pagination-rounded">
                                <li class="page-item disabled">
                                    <a class="page-link" href="#" tabindex="-1">&lt;</a>
                                </li>
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                            </ul>
                        </nav>
                    </div>-->

            <!-- Modal -->
            <div class="modal fade" id="createFlowerModal" tabindex="-1" aria-labelledby="createFlowerModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content rounded-4">
                        <div class="modal-header bg-success text-white">
                            <h5 class="modal-title" id="createFlowerModalLabel">Add New Flower</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="AddRaw" method="post" >
                                <div class="mb-3">
                                    <label for="createFlowerName" class="form-label">Flower Name</label>
                                    <input type="text" class="form-control" id="createFlowerName" required />
                                </div>
                                <div class="mb-3">
                                    <label for="createFlowerQuantity" class="form-label">Quantity</label>
                                    <input type="number" class="form-control" id="createFlowerQuantity" required />
                                </div>
                                <div class="mb-3 ">
                                    <label for="createFlowerImage" class="form-label">Flower Image</label>
                                    <input type="file" class="form-control" id="createFlowerImage" required />
                                </div>
                                <div class="mb-3">
                                    <label for="createExpireDate" class="form-label">Expire Date</label>
                                    <input type="date" class="form-control" id="createExpireDate" required />
                                </div>
                                <button type="submit" class="btn btn-success w-100">Create Flower</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="updateFlowerModal" tabindex="-1" aria-labelledby="updateFlowerModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content rounded-4">
                        <div class="modal-header bg-primary text-white">
                            <h5 class="modal-title" id="updateFlowerModalLabel">Update Flower</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="UpdateRaw" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="id" id="updateFlowerId" />

                                <div class="mb-3">
                                    <label for="updateFlowerName" class="form-label">Flower Name</label>
                                    <input type="text" class="form-control" name="name" id="updateFlowerName" required />
                                </div>
                                <div class="mb-3">
                                    <label for="updateFlowerQuantity" class="form-label">Quantity</label>
                                    <input type="number" class="form-control" name="quantity" id="updateFlowerQuantity" required />
                                </div>
                                <div class="mb-3">
                                    <label for="updateFlowerImage" class="form-label">Flower Image</label>
                                    <input type="file" class="form-control" name="image" id="updateFlowerImage" />
                                </div>
                                <div class="mb-3">
                                    <label for="updateExpireDate" class="form-label">Expire Date</label>
                                    <input type="date" class="form-control" name="expireDate" id="updateExpireDate" required />
                                </div>
                                <div class="mb-3">
                                    <label for="UpdateCreateDate" class="form-label">Import Date</label>
                                    <input type="date" class="form-control" name="importDate" id="UpdateCreateDate" required />
                                </div>
                                <div class="mb-3">
                                    <label for="updateStatus" class="form-label">Status</label>
                                    <input type="text" class="form-control" name="status" id="updateStatus" required />
                                </div>

                                <button type="submit" class="btn btn-primary w-100">Update Flower</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Scripts -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            <script>
                                    const searchInput = document.getElementById("searchInput");
                                    const statusFilter = document.getElementById("statusFilter");
                                    const impDateInput = document.getElementById("createDate");
                                    const expDateInput = document.getElementById("expireDate");
                                    const table = document.querySelector("table tbody");

                                    searchInput.addEventListener("input", filterTable);
                                    statusFilter.addEventListener("change", filterTable);
                                    impDateInput.addEventListener("change", filterTable);
                                    expDateInput.addEventListener("change", filterTable);

                                    function filterTable() {
                                        const searchText = searchInput.value.toLowerCase();
                                        const selectedStatus = statusFilter.value;
                                        const impDate = impDateInput.value;
                                        const expDate = expDateInput.value;

                                        const rows = table.querySelectorAll("tr");

                                        rows.forEach((row) => {
                                            const name = row.children[2].textContent.toLowerCase();
                                            const status = row.children[6].textContent.trim();
                                            const rowImpDate = row.children[5].textContent.trim();
                                            const rowExpDate = row.children[4].textContent.trim();

                                            let show = true;

                                            // Search filter
                                            if (!name.includes(searchText)) {
                                                show = false;
                                            }

                                            // Status filter
                                            if (selectedStatus && status !== selectedStatus) {
                                                show = false;
                                            }

                                            // Import Date filter
                                            if (impDate && rowImpDate !== impDate) {
                                                show = false;
                                            }

                                            // Expire Date filter
                                            if (expDate && rowExpDate !== expDate) {
                                                show = false;
                                            }

                                            row.style.display = show ? "" : "none";
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

                                        rows.forEach((row) => table.appendChild(row));
                                        table.setAttribute("data-sort", ascending ? "asc" : "desc");
                                    }
                                    const updateModal = document.getElementById('updateFlowerModal');
                                    updateModal.addEventListener('show.bs.modal', function (event) {
                                        const button = event.relatedTarget;
                                        document.getElementById('updateFlowerId').value = button.getAttribute('data-id');
                                        document.getElementById('updateFlowerName').value = button.getAttribute('data-name');
                                        document.getElementById('updateFlowerQuantity').value = button.getAttribute('data-quantity');
                                        document.getElementById('updateExpireDate').value = button.getAttribute('data-expire');
                                        document.getElementById('UpdateCreateDate').value = button.getAttribute('data-import');
                                        document.getElementById('updateStatus').value = button.getAttribute('data-status');
                                    });
            </script>
    </body>

</html>
