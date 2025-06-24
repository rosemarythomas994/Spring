package com.studentsearch.model;

import java.util.List;

public class GridData {
  
    private List<Student> gridData;
    private int page;         
    private int total;         
    private int records;     
    
    public List<Student> getGridData() {
        return gridData;
    }

    public void setGridData(List<Student> gridData) {
        this.gridData = gridData;
    }


  

    // Getter and Setter for page
    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    // Getter and Setter for total
    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    // Getter and Setter for records
    public int getRecords() {
        return records;
    }

    public void setRecords(int records) {
        this.records = records;
    }
}