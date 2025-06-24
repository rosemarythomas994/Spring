package com.studentsearch.action;

import static com.studentsearch.constants.StudentManagmentConstants.COL_ADDRESS;
import static com.studentsearch.constants.StudentManagmentConstants.COL_DEPARTMENT;
import static com.studentsearch.constants.StudentManagmentConstants.COL_DOA;
import static com.studentsearch.constants.StudentManagmentConstants.COL_DOB;
import static com.studentsearch.constants.StudentManagmentConstants.COL_GENDER;
import static com.studentsearch.constants.StudentManagmentConstants.COL_NAME;
import static com.studentsearch.constants.StudentManagmentConstants.COL_STUDENT_ID;
import static com.studentsearch.constants.StudentManagmentConstants.DELETE_STUDENT;
import static com.studentsearch.constants.StudentManagmentConstants.INSERT_STUDENT;
import static com.studentsearch.constants.StudentManagmentConstants.SELECT_ALL_STUDENT;
import static com.studentsearch.constants.StudentManagmentConstants.SELECT_STUDENT_BY_ID;
import static com.studentsearch.constants.StudentManagmentConstants.UPDATE_STUDENT;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.CookiesAware;
import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.interceptor.SessionAware;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.studentsearch.model.GridData;
import com.studentsearch.model.Student;
import com.studentsearch.util.DBConnection;

@SuppressWarnings("deprecation")
public class StudentAction extends ActionSupport implements ModelDriven<Student>, SessionAware, ApplicationAware, CookiesAware, ParameterAware {	
	private Map<String, Object> session;
    private Map<String, Object> application;
    private Map<String, String> cookies;
    private Map<String, String[]> parameters;
    private static final long serialVersionUID = 1L;
    private static final Logger logger = LoggerFactory.getLogger(StudentAction.class);
    private Map<String, String> departmentList; // New field for departments
    private Student student;
    private String actionType;
    private GridData gridData = new GridData();
    private transient DBConnection dbConnection = new DBConnection();

    private static final String DB_ERROR = "Database error: ";
    private static final String SQL_ERROR = "SQLException: ";

    @Override
    public Student getModel() {
        if (student == null) {
            student = new Student();
        }
        return student;
    }
    private void initDepartmentList() {
        departmentList = new LinkedHashMap<>();
        departmentList.put("", "-- Select Department --");
        departmentList.put("IT", "IT");
        departmentList.put("CSE", "CSE");
        departmentList.put("Mechanical", "Mechanical");
        departmentList.put("ECE", "ECE");
        departmentList.put("Civil", "Civil");
    }
    public String studenthome() {
        return SUCCESS;
    }

    public String studentSearch() {
    	initDepartmentList();
        ServletActionContext.getRequest().setAttribute("departmentList", departmentList);
        return SUCCESS;
    }

    public String studentAdd() {
        student = new Student();
        initDepartmentList();
        ServletActionContext.getRequest().setAttribute("departmentList", departmentList);
        return SUCCESS;
    }

    public Map<String, String> getDepartmentList() {
        return departmentList;
    }
    public String getActionType() {
        return actionType;
    }

    public void setActionType(String actionType) {
        this.actionType = actionType;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public GridData getGridData() {
        return gridData;
    }

    public void setGridData(GridData gridData) {
        this.gridData = gridData;
    }

    public String list() {
        List<Student> studentList = new ArrayList<>();
        StringBuilder query = new StringBuilder(SELECT_ALL_STUDENT);

        List<Object> params = new ArrayList<>();
        logger.info("Search params: studentId=: {}",
				student.getStudentId() + ", name=" + student.getName() + ", department=" + student.getDepartment()
						+ ", dob=" + student.getDob() + ", doa=" + student.getDoa() + ", gender="
						+ student.getGender());
        logger.info("Search Params: {}", student);
        System.out.println("Search Params: {}"+ student);

        Optional.ofNullable(student.getStudentId()).filter(id -> id > 0).ifPresent(id -> {
        	query.append(" AND student_id = ?");
			params.add(id);
		});

		Optional.ofNullable(student.getName()).filter(name -> !name.trim().isEmpty()).ifPresent(name -> {
			query.append(" AND LOWER(name) LIKE LOWER(?)");
			params.add("%" + name.trim() + "%");
		});

		Optional.ofNullable(student.getDepartment()).filter(department -> !department.trim().isEmpty())
				.ifPresent(department -> {
					query.append(" AND LOWER(department) LIKE LOWER(?)");
					params.add("%" + department.trim() + "%");
				});

		Optional.ofNullable(student.getDob()).ifPresent(dob -> {
			query.append(" AND dob = ?");
			params.add(new java.sql.Date(dob.getTime()));
		});

		Optional.ofNullable(student.getDoa()).ifPresent(doa -> {
			query.append(" AND doa = ?");
			params.add(new java.sql.Date(doa.getTime()));
		});

		Optional.ofNullable(student.getGender()).filter(gender -> !gender.trim().isEmpty()).ifPresent(gender -> {
			query.append(" AND gender = ?");
			params.add(gender.trim());
		});


		try (Connection conn = dbConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(query.toString())) {

			for (int i = 0; i < params.size(); i++) {
				stmt.setObject(i + 1, params.get(i));
			}

			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					Student s = new Student();
					s.setStudentId(rs.getInt(COL_STUDENT_ID));
					s.setName(rs.getString(COL_NAME));
					s.setDepartment(rs.getString(COL_DEPARTMENT));
					s.setDob(rs.getDate(COL_DOB));
					s.setDoa(rs.getDate(COL_DOA));
					s.setGender(rs.getString(COL_GENDER));
					s.setAddress(rs.getString(COL_ADDRESS));
					studentList.add(s);
				}
			}
			student.setStudentList(studentList);
            gridData.setGridData(studentList);
            System.out.println(studentList);
            gridData.setRecords(studentList.size());
            int rowsPerPage = 10; 
            gridData.setTotal((int) Math.ceil((double) studentList.size() / rowsPerPage));
            gridData.setPage(1); // Default to first page
            System.out.println("Grid Data: " + gridData);
            getModel().setGridData(gridData);
            return SUCCESS;
        } catch (SQLException e) {
            logger.error(SQL_ERROR, e);
            addActionError(DB_ERROR + e.getMessage());
            return ERROR;
        }
    }

    public String search() {
        List<Student> studentList = new ArrayList<>();
        StringBuilder query = new StringBuilder(SELECT_ALL_STUDENT);
        List<Object> params = new ArrayList<>();
        logger.info("Search params: studentId={} name={} department={} dob={} doa={} gender={}",
                student.getStudentId(), student.getName(), student.getDepartment(),
                student.getDob(), student.getDoa(), student.getGender());
        logger.info("Search Params: {}", student);

        Optional.ofNullable(student.getStudentId()).filter(id -> id > 0).ifPresent(id -> {
            query.append(" AND student_id = ?");
            params.add(id);
        });

        Optional.ofNullable(student.getName()).filter(name -> !name.trim().isEmpty()).ifPresent(name -> {
            query.append(" AND LOWER(name) LIKE LOWER(?)");
            params.add("%" + name.trim() + "%");
        });

        Optional.ofNullable(student.getDepartment()).filter(department -> !department.trim().isEmpty()).ifPresent(department -> {
            query.append(" AND LOWER(department) LIKE LOWER(?)");
            params.add("%" + department.trim() + "%");
        });

        Optional.ofNullable(student.getDob()).ifPresent(dob -> {
            query.append(" AND dob = ?");
            params.add(new java.sql.Date(dob.getTime()));
        });

        Optional.ofNullable(student.getDoa()).ifPresent(doa -> {
            query.append(" AND doa = ?");
            params.add(new java.sql.Date(doa.getTime()));
        });

        Optional.ofNullable(student.getGender()).filter(gender -> !gender.trim().isEmpty()).ifPresent(gender -> {
            query.append(" AND gender = ?");
            params.add(gender.trim());
        });

        try (Connection conn = dbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query.toString())) {
            if (conn == null) {
                logger.error("Failed to establish database connection");
                addActionError("Failed to connect to the database");
                return ERROR;
            }

            for (int i = 0; i < params.size(); i++) {
                stmt.setObject(i + 1, params.get(i));
            }

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Student s = new Student();
                    s.setStudentId(rs.getInt(COL_STUDENT_ID));
                    s.setName(rs.getString(COL_NAME));
                    s.setDepartment(rs.getString(COL_DEPARTMENT));
                    s.setDob(rs.getDate(COL_DOB));
                    s.setDoa(rs.getDate(COL_DOA));
                    s.setGender(rs.getString(COL_GENDER));
                    s.setAddress(rs.getString(COL_ADDRESS));
                    studentList.add(s);
                }
            }
            gridData.setGridData(studentList);
            gridData.setRecords(studentList.size());
            gridData.setTotal((int) Math.ceil((double) studentList.size() / 10));
            gridData.setPage(1);
            logger.info("Search Grid Data: {}", gridData);
            return SUCCESS;
        } catch (SQLException e) {
            logger.error("SQLException in search: {}", e.getMessage(), e);
            addActionError(DB_ERROR + e.getMessage());
            return ERROR;
        }
    }

    public String createStudent() {
        String query = student.getStudentId() > 0 ? UPDATE_STUDENT : INSERT_STUDENT;

        try (Connection conn = dbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, student.getName());
            stmt.setString(2, student.getDepartment());
            stmt.setDate(3, student.getDob() != null ? new java.sql.Date(student.getDob().getTime()) : null);
            stmt.setDate(4, student.getDoa() != null ? new java.sql.Date(student.getDoa().getTime()) : null);
            stmt.setString(5, student.getGender());
            stmt.setString(6, student.getAddress());

            if (student.getStudentId() > 0) {
                stmt.setInt(7, student.getStudentId());
            }

            stmt.executeUpdate();
            return "Save and Return".equals(actionType) ? "list" : SUCCESS;

        } catch (SQLException e) {
            logger.error(SQL_ERROR, e);
            addActionError(DB_ERROR + e.getMessage());
            return ERROR;
        }
    }

    public String updateStudent() {
        try (Connection conn = dbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_STUDENT_BY_ID)) {

            stmt.setInt(1, student.getStudentId());
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    student.setName(rs.getString(COL_NAME));
                    student.setDepartment(rs.getString(COL_DEPARTMENT));
                    student.setDob(rs.getDate(COL_DOB));
                    student.setDoa(rs.getDate(COL_DOA));
                    student.setGender(rs.getString(COL_GENDER));
                    student.setAddress(rs.getString(COL_ADDRESS));
                   
                }
                else {
                    addActionError("Student not found with ID: " + student.getStudentId());
                    return INPUT;
                }
            }
            initDepartmentList();
            return SUCCESS;

        } catch (SQLException e) {
            logger.error(SQL_ERROR, e);
            addActionError(DB_ERROR + e.getMessage());
            return INPUT;
        }
    }

    public String deleteStudent() {
        try (Connection conn = dbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(DELETE_STUDENT)) {

            stmt.setInt(1, student.getStudentId());
            stmt.executeUpdate();
            return SUCCESS;

        } catch (SQLException e) {
            logger.error(SQL_ERROR, e);
            addActionError(DB_ERROR + e.getMessage());
            return INPUT;
        }
    }

    @Override
    public void setParameters(Map<String, String[]> arg0) {
        this.parameters = arg0;
    }

    @Override
    public void setCookiesMap(Map<String, String> arg0) {
        this.cookies = arg0;
    }

    @Override
    public void setApplication(Map<String, Object> arg0) {
        this.application = arg0;
    }

    @Override
    public void setSession(Map<String, Object> arg0) {
        this.session = arg0;
    }
}