package data;

import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ResultList implements Serializable {

    int status;
    int count = 1;

    public void ResultList() {

    }

    private final List<ResultRow> rows = new ArrayList<>();

    public void add(ResultRow row) {
        row.setId(count++);
        rows.add(row);
    }

    public List<ResultRow> getRows() {
        return rows;
    }
    public void setStatus(int status) {
        this.status = status;
    }

    public int getStatus() {
        return status;
    }
}


