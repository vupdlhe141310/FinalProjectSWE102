
package model;


public class Reported {
    int ma_san_pham;
    String li_do;

    public Reported() {
    }

    public Reported(int ma_san_pham, String li_do) {
        this.ma_san_pham = ma_san_pham;
        this.li_do = li_do;
    }

    public int getMa_san_pham() {
        return ma_san_pham;
    }

    public void setMa_san_pham(int ma_san_pham) {
        this.ma_san_pham = ma_san_pham;
    }

    public String getLi_do() {
        return li_do;
    }

    public void setLi_do(String li_do) {
        this.li_do = li_do;
    }

    @Override
    public String toString() {
        return "Reported{" + "ma_san_pham=" + ma_san_pham + ", li_do=" + li_do + '}';
    }
    
}
