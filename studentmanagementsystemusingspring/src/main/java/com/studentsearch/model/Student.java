package com.studentsearch.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Student implements Serializable {
    private static final long serialVersionUID = 1L;
    private int studentId;
    private String name;
    private String department;
    private Date dob;
    private Date doa;
    private String gender;
    private String address;
    private GridData gridData;
    private List<Student> studentList;

	public List<Student> getStudentList() {
		return studentList;
	}

	public void setStudentList(List<Student> studentList) {
		this.studentList = studentList;
	}
  

	public GridData getGridData() {
		return gridData;
	}

	public void setGridData(GridData gridData) {
		this.gridData = gridData;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	// Remove studentList field and its getters/setters
    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public Date getDoa() {
        return doa;
    }

    public void setDoa(Date doa) {
        this.doa = doa;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Student [studentId=" + studentId + ", name=" + name + ", department=" + department + ", dob=" + dob
                + ", doa=" + doa + ", gender=" + gender + ", address=" + address + "]";
    }
}