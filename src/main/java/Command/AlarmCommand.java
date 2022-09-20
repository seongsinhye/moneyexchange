package Command;

public class AlarmCommand {

    private String name;
    private String moneytype;
    private String exchangType;
    private String time;
    private String tel;
    private String email;

    public AlarmCommand(){}

    public AlarmCommand(String name, String moneytype, String exchangType, String time, String tel, String email) {
        this.name = name;
        this.moneytype = moneytype;
        this.exchangType = exchangType;
        this.time = time;
        this.tel = tel;
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMoneytype() {
        return moneytype;
    }

    public void setMoneytype(String moneytype) {
        this.moneytype = moneytype;
    }

    public String getExchangType() {
        return exchangType;
    }

    public void setExchangType(String exchangType) {
        this.exchangType = exchangType;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
