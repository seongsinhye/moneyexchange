package dto;

public class AlarmCommand {

    private String user_name;
    private String tel;
    private String exchangeTime;
    private String ac;
    private String type;


    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getExchangeTime() {
        return exchangeTime;
    }

    public void setExchangeTime(String exchangeTime) {
        this.exchangeTime = exchangeTime;
    }

    public String getAc() {
        return ac;
    }

    public void setAc(String ac) {
        this.ac = ac;
    }

    public String getType() {
        return type;
    }

    public void setExchangType(String type) {
        this.type = type;
    }

    public AlarmCommand() {
    }


    public AlarmCommand(String user_name, String tel, String exchangeTime, String ac, String type) {
        this.user_name = user_name;
        this.tel = tel;
        this.exchangeTime = exchangeTime;
        this.ac = ac;
        this.type = type;
    }
}