package servlets;

import data.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.HttpConstraint;
import jakarta.servlet.annotation.HttpMethodConstraint;
import jakarta.servlet.annotation.ServletSecurity;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@ServletSecurity(
        value = @HttpConstraint(
                rolesAllowed = {
                        "secured"
                }),
        httpMethodConstraints = {
                @HttpMethodConstraint(value = "GET", rolesAllowed = {
                        "secured"
                }),
                @HttpMethodConstraint(value = "POST", rolesAllowed = {
                        "secured"
                })
        })

public class AreaCheckServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long startTime = System.currentTimeMillis();
        ResultList result = (ResultList) req.getSession().getAttribute("result");

        if(result == null) {
            result = new ResultList();
        }

        try {
            Float.parseFloat(req.getParameter("x"));
            Float.parseFloat(req.getParameter("y"));
            Float.parseFloat(req.getParameter("r"));
        } catch (NumberFormatException e) {
            result.setStatus(1);
            req.getSession().setAttribute("result", result);
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
//            resp.sendError(500);
            return;
        }

        float x = Float.parseFloat(req.getParameter("x"));
        float y = Float.parseFloat(req.getParameter("y"));
        float r = Float.parseFloat(req.getParameter("r"));

//        System.out.println("x = " + x);
        ResultRow row = new ResultRow();
        row.setX(x);
        row.setY(y);
        row.setR(r);
        row.setIsHit(checkHit(x, y, r));
        row.setWorkTime(System.currentTimeMillis() - startTime);


        Date date = new Date();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        row.setCurrentTime(df.format(date));


        result.add(row);
        result.setStatus(0);
        req.getSession().setAttribute("result", result);
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    private String checkHit(float x, float y, float r) {
        if (x < 0 && y < 0) {
            if (Math.pow(x, 2) + Math.pow(y, 2) <= Math.pow(r, 2)) return "Hit";
        } else if (x > 0 && y > 0) {
            if (y <= -2 * x + r) return "Hit";
        } else if (x > 0 && y < 0) {
            if (x <= r && -y <= r) return "Hit";
        } else if (x == 0){
            if(y <= r && y >= -r) return "Hit";
        } else if (y == 0){
            if(x <= r && x >= -r) return "Hit";
        }
        return "Miss";
    }
}
