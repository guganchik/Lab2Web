package data;

public class Validator {
    private final float x;
    private final float y;
    private final float r;

    public Validator(float x, float y, float r) {
        this.x = x;
        this.y = y;
        this.r = r;
    }

    private boolean validateX() {
        return !(x < -5) && !(x > 3);
    }
    private boolean validateY() {
        return !(y < -3) && !(y > 3);
    }
    private boolean validateR() {
        return !(r < 1) && !(r > 3);
    }
    public boolean validateAll() {
        return validateX() && validateY() && validateR();
    }
}