package com.studentsearch.constants;

public class StudentManagmentConstants {
	 private StudentManagmentConstants() {
	    }
  
	// Navigation constants
    public static final String HOME_PAGE = "studenthome";
    public static final String STUDENT_SEARCH = "search";
    public static final String STUDENT_LIST = "list";
  
    
    // SQL Queries
    public static final String SELECT_ALL_STUDENT = 
        "SELECT student_id, name, department, dob, doa, gender, address FROM students WHERE 1=1";

    public static final String SELECT_STUDENT_BY_ID = 
        "SELECT student_id, name, department, dob, doa, gender, address FROM students WHERE student_id = ?";

    public static final String DELETE_STUDENT = 
        "DELETE FROM students WHERE student_id = ?";

    public static final String UPDATE_STUDENT = 
        "UPDATE students SET name=?, department=?, dob=?, doa=?, gender=?, address=? WHERE student_id=?";

    public static final String INSERT_STUDENT = 
        "INSERT INTO students (name, department, dob, doa, gender, address) VALUES (?, ?, ?, ?, ?, ?)";
    
    //DATABSE Constants
    public static final String COL_STUDENT_ID = "student_id";
    public static final String COL_NAME = "name";
    public static final String COL_DEPARTMENT = "department";
    public static final String COL_DOB = "dob";
    public static final String COL_DOA = "doa";
    public static final String COL_GENDER = "gender";
    public static final String COL_ADDRESS = "address";
    
    
    // DB Credentials
    public static final String USERNAME = "sa";
    public static final String PASSWORD = "sa@2024";
}
