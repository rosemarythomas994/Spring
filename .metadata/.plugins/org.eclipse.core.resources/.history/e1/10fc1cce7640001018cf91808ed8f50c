/**
 * This package contains model classes for the Student Management System,
 * such as and data wrappers like GridData.
 */
package com.student.model;

import java.io.Serializable;
import java.util.Date;

/**
 * The Student class represents a student entity in the Student Management System.
 * It includes student attributes like ID, name, department, date of birth, date of admission,
 * gender, and address.
 * This class implementsSerializable to support session persistence and object serialization.
 *
 * @author Rose Mary Thomas
 * @version 1.0
 * @since 2025-05-30
 */
public class StudentValue implements Serializable {
    private static final long serialVersionUID = 1L;
    private int studentId;
    private String name;
    private String department;
    private Date dob;
    private Date doa;
    private String gender;
    private String address;

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

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