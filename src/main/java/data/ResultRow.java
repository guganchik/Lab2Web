package data;

import java.io.Serializable;

public class ResultRow implements Serializable {

    public void ResultRow() {

    }

    int id;
    private float x;
    private float y;
    private float r;
    private String isHit;
    private String currentTime;
    private long workTime;


    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }
    public float getX() {
        return x;
    }

    public void setX(float x) {
        this.x = x;
    }

    public float getY() {
        return y;
    }

    public void setY(float y) {
        this.y = y;
    }

    public float getR() {
        return r;
    }

    public void setR(float r) {
        this.r = r;
    }

    public String getIsHit() {
        return isHit;
    }

    public void setIsHit(String isHit) {
        this.isHit = isHit;
    }

    public void setCurrentTime(String currentTime) {
        this.currentTime = currentTime;
    }

    public String getCurrentTime() {
        return currentTime;
    }

    public void setWorkTime(long workTime) {
        this.workTime = workTime;
    }

    public long getWorkTime() {
        return workTime;
    }
}
