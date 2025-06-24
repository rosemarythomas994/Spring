/**
 * This package provides utility classes used across the Student Management System,
 * including database connection helpers and data converters.
 */
package com.student.util;

import static com.student.constants.StudentManagmentConstants.PASSWORD;
import static com.student.constants.StudentManagmentConstants.USERNAME;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Utility class responsible for providing database connections using the
 * Microsoft SQL Server JDBC driver.
 *
 * It handles loading the driver class and managing connection exceptions,
 * and uses constants for DB credentials from com.studentsearch.constants.StudentManagmentConstants.
 *
 * Note: Update database URL, username, and password constants as needed for your environment.
 *
 * @author Rose Mary Thomas
 * @version 1.0
 * @since 2025-05-30
 */
public class DBConnection {
    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=studentsearch;encrypt=true;trustServerCertificate=true";
    private static final Logger logger = LoggerFactory.getLogger(DBConnection.class);

    /**
     * Establishes and returns a connection to the SQL Server database.
     *
     * @return Connection object to the database
     * @throws SQLException if the driver is not found or connection fails
     */
    public Connection getConnection() throws SQLException {
    	try {
    	    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    	} catch (ClassNotFoundException e) {
    	    logger.error("JDBC Driver not found: {}", e.getMessage(), e);
    	    throw new SQLException("JDBC Driver not found", e); // Good: add context
    	}

    	try {
    	    return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    	} catch (SQLException e) {
    	    logger.error("Failed to establish database connection: {}", e.getMessage(), e);
    	    throw e; // OK: already logged and propagated
    	}
    }
}