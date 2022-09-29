package User.Dto;

public class UserInfo {


    private String id;
    private String pw;
    private String name;
    private String tel;
    private String addr;

    private Boolean sns;

    public UserInfo() {
    }

    public UserInfo( String id, String pw, String name, String tel, String addr, Boolean sns) {
        this.id = id;
        this.pw = pw;
        this.name = name;
        this.tel = tel;
        this.addr = addr;
        this.sns = sns;
    }


    public Boolean getSns() {
        return sns;
    }

    public void setSns(Boolean sns) {
        this.sns = sns;
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
