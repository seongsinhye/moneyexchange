package User.Dto;

public class JoinCommand {

    private String id;
    private String pw;
    private String pw_check;
    private String name;
    private String tel;
    private String addr;

    public JoinCommand() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getPw_check() {
        return pw_check;
    }

    public void setPw_check(String pw_check) {
        this.pw_check = pw_check;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }
}
