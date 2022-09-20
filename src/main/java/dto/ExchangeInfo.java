package dto;

public class ExchangeInfo {

    private String cur_unit;
    private String ttb;
    private String tts;
    private String deal_bas_r;
    private String cur_nm;

    public ExchangeInfo(String cur_unit, String ttb, String tts, String deal_bas_r, String cur_nm) {
        this.cur_unit = cur_unit;
        this.ttb = ttb;
        this.tts = tts;
        this.deal_bas_r = deal_bas_r;
        this.cur_nm = cur_nm;
    }

    public ExchangeInfo() {

    }

    public String getCur_unit() {
        return cur_unit;
    }

    public void setCur_unit(String cur_unit) {
        this.cur_unit = cur_unit;
    }

    public String getTtb() {
        return ttb;
    }

    public void setTtb(String ttb) {
        this.ttb = ttb;
    }

    public String getTts() {
        return tts;
    }

    public void setTts(String tts) {
        this.tts = tts;
    }

    public String getDeal_bas_r() {
        return deal_bas_r;
    }

    public void setDeal_bas_r(String deal_bas_r) {
        this.deal_bas_r = deal_bas_r;
    }

    public String getCur_nm() {
        return cur_nm;
    }

    public void setCur_nm(String cur_nm) {
        this.cur_nm = cur_nm;
    }
}
