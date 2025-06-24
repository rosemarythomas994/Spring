package com.studentsearch.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import static com.studentsearch.constants.StudentManagmentConstants.USERNAME;
import static com.studentsearch.constants.StudentManagmentConstants.PASSWORD;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DBConnection {
    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=studentsearch;encrypt=true;trustServerCertificate=true";
    private static final Logger logger = LoggerFactory.getLogger(DBConnection.class);

    public Connection getConnection() throws SQLException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException e) {
            logger.error("JDBC Driver not found: {}", e.getMessage(), e);
            throw new SQLException("JDBC Driver not found", e);
        }
        Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        if (conn == null) {
            throw new SQLException("Failed to establish database connection");
        }
        logger.info("Database connection established successfully");
        return conn;
    }
}