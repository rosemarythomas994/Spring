/**
 * This package contains application-level constants used across the Student Management System.
 * It includes navigation constants, SQL query strings, database column names, and credentials.
 *
 * These constants help avoid hardcoding strings and improve maintainability and readability
 * of the source code.
 */
package com.student.constants;

/**
 * The class holds constant values used throughout the Student Management
 * System. This includes: Navigation constants used in Struts action result
 * mappings. SQL queries for CRUD operations on the table Database column names
 * used for mapping result sets Database credentials (Note: for demo purposes
 * only; credentials should not be hardcoded in production) This class is final
 * and not intended to be instantiated.
 * 
 * @author Rose Mary Thomas
 * @version 1.0
 * @since 2025-05-30
 */
public class StudentManagmentConstants {

	private StudentManagmentConstants() {
	}

	public static final String HOME_PAGE = "studenthome";
	public static final String STUDENT_SEARCH = "search";
	public static final String STUDENT_LIST = "list";

	public static final String SELECT_ALL_STUDENT = "SELECT student_id, name, department, dob, doa, gender, address FROM students WHERE 1=1";

	public static final String SELECT_STUDENT_BY_ID = "SELECT student_id, name, department, dob, doa, gender, address FROM students WHERE student_id = ?";

	public static final String DELETE_STUDENT = "DELETE FROM students WHERE student_id = ?";

	public static final String UPDATE_STUDENT = "UPDATE students SET name=?, department=?, dob=?, doa=?, gender=?, address=? WHERE student_id=?";

	public static final String INSERT_STUDENT = "INSERT INTO students (name, department, dob, doa, gender, address) VALUES (?, ?, ?, ?, ?, ?)";

	public static final String COL_STUDENT_ID = "student_id";
	public static final String COL_NAME = "name";
	public static final String COL_DEPARTMENT = "department";
	public static final String COL_DOB = "dob";
	public static final String COL_DOA = "doa";
	public static final String COL_GENDER = "gender";
	public static final String COL_ADDRESS = "address";

	public static final String USERNAME = "sa";
	public static final String PASSWORD = "sa@2024";
}
