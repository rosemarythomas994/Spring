<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>List Students</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" />
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/free-jqgrid@4.15.5/css/ui.jqgrid.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/free-jqgrid@4.15.5/js/i18n/grid.locale-en.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/free-jqgrid@4.15.5/js/jquery.jqgrid.min.js"></script>
    <style>
        .container { margin: 20px; max-width: 1200px; }
        .ui-jqgrid { width: 100% !important; border-collapse: collapse; }
        .ui-jqgrid-view { width: 100% !important; }
        .ui-jqgrid-hdiv, .ui-jqgrid-bdiv { width: 100% !important; }
        .ui-jqgrid tr.jqgrow td { padding: 6px 8px; border: 1px solid #ddd; }
        .ui-jqgrid .ui-jqgrid-htable th { background-color: #e9ecef; padding: 8px; border: 1px solid #ddd; font-weight: bold; }
        .ui-jqgrid .ui-jqgrid-pager { background-color: #e9ecef; border-top: 1px solid #ddd; }
        .ui-jqgrid tr.jqgrow { background-color: #fff; }
        .ui-jqgrid tr.jqgrow:nth-child(even) { background-color: #f8f9fa; }
        .action-links a { margin-right: 5px; color: #007bff; text-decoration: none; }
        .action-links a:hover { text-decoration: underline; }
    </style>

<script>
$(function () {
    $("#studentGrid").jqGrid({
        url: 'list.action',
        datatype: "json",
        mtype: "POST",
        colNames: ['#', 'ID', 'Name', 'Department', 'DOB', 'DOA', 'Gender', 'Address', 'Actions'],
        colModel: [
            { name: 'rn', index: 'rn', width: 30, align: 'center', sortable: false, hidden: true },
            { 
                name: 'studentId', 
                index: 'studentId', 
                width: 60, 
                align: 'center', 
                key: true,
                formatter: function(cellvalue, options, rowObject) {
                    return '<a href="edit.action?student.studentId=' + cellvalue + '">' + cellvalue + '</a>';
                }
            },
            { name: 'name', index: 'name', width: 150, sortable: true, align: 'left' },
            { name: 'department', index: 'department', width: 100, sortable: true, align: 'left' },
            { name: 'dob', index: 'dob', width: 90, align: 'center', formatter: 'date', formatoptions: { srcformat: 'ISO8601Long', newformat: 'm/d/y' } },
            { name: 'doa', index: 'doa', width: 90, align: 'center', formatter: 'date', formatoptions: { srcformat: 'ISO8601Long', newformat: 'm/d/y' } }, 
            { name: 'gender', index: 'gender', width: 70, align: 'center', sortable: true },
            { name: 'address', index: 'address', width: 200, sortable: true, align: 'left' },
            { 
                name: 'actions', 
                index: 'actions', 
                width: 100, 
                sortable: false, 
                align: 'center', 
                formatter: function(cellvalue, options, rowObject) {
                    return '<span class="action-links">' +
                           '[<a href="delete.action?student.studentId=' + rowObject.studentId + '" onclick="return confirm(\'Are you sure?\')">Delete</a>]' +
                           '</span>';
                }
            }
        ],
        pager: "#pager",
        rowNum: 10,
        rowList: [10, 20, 30],
        sortname: 'studentId',
        sortorder: "desc",
        viewrecords: true,
        gridview: true,
        autoencode: true,
        height: 'auto',
        caption: "All Students",
        loadonce: false,
        autowidth: true,
        shrinkToFit: true,
        rownumbers: true,
        rownumWidth: 30,
        jsonReader: {
            repeatitems: false,
            root: "gridData",
            id: "studentId",
            page: "page",
            total: "total",
            records: "records"
        },
        loadError: function(xhr, status, error) {
            console.log("Error loading grid: " + error);
            console.log("Status: " + status);
            console.log("Response: " + xhr.responseText);
        },
        loadComplete: function(data) {
            console.log("Grid loaded successfully");
            console.log("Data received: ", data);
        },
        beforeRequest: function() {
            console.log("Sending request to: " + this.p.url);
        }
    });
    $("#searchForm").on("submit", function(e) {
        e.preventDefault();
        var formData = $(this).serialize();
        $("#studentGrid").jqGrid('setGridParam', {
            url: 'search.action?' + formData,
            datatype: 'json'
        }).trigger('reloadGrid');
    });
});
</script> 
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark px-3">
        <div class="collapse navbar-collapse" id="navbarMain">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="index.jsp">DEMO-US</a></li>
                <li class="nav-item dropdown">
                    <button class="nav-link dropdown-toggle btn btn-link" id="exportDropdown" data-bs-toggle="dropdown" aria-expanded="false">Student Operations</button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="searchStudent.action">Search Student</a></li>
                        <li><a class="dropdown-item" href="addStudent.action">Add Student</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="navbar-nav d-flex align-items-center gap-3">
                <li class="nav-item"><a class="nav-link" href="#"><i class="fa-solid fa-house-chimney mr-5"></i></a></li>
                <li class="nav-item"><a class="nav-link" href="#"><i class="fa-solid fa-gauge mr-5"></i></a></li>
                <li class="nav-item"><a class="nav-link" href="#"><i class="fa-solid fa-bell mr-5"></i></a></li>
                <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#"><i class="fa-solid fa-wrench mr-5"><ul class="dropdown-menu"></ul></i></a></li>
                <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#"><i class="fa-solid fa-star mr-5"><ul class="dropdown-menu"></ul></i></a></li>
                <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#"><i class="fa-solid fa-circle-question mr-5"><ul class="dropdown-menu"></ul></i></a></li>
                <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#"><i class="fa-solid fa-book mr-5"><ul class="dropdown-menu"></ul></i></a></li>
                <li class="nav-item"><a class="nav-link" href="#"><i class="fa-solid fa-envelope mr-5"></i></a></li>
                <li class="nav-item"><a class="nav-link" href="#"><i class="fa-solid fa-arrow-right-from-bracket mr-5"></i></a></li>
            </ul>
        </div>
    </nav>
    <div class="container mt-2 bg-light">
        <div class="container-fluid p-3 bg-light text-center">
            <h2>List Students</h2>
        </div>
        <div class="container mt-5 bg-light">
            <div class="mb-3 text-left">
                <a href="addStudent.action" class="btn btn-success">Add Student</a>
                <a href="searchStudent" class="btn btn-secondary">Back</a>
            </div>
            <table id="studentGrid"></table>
            <div id="pager"></div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>