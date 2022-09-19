package User.Dto;

public class LoginCommand {

    private String id;
    private String pw;
    private boolean remember_me;

    public LoginCommand() {
    }

    public LoginCommand(boolean remember_me) {
        this.remember_me = remember_me;
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

    public boolean getRemember_me() {
        return remember_me;
    }

    public void setRemember_me(boolean remember_me) {
        this.remember_me = remember_me;
    }
}
