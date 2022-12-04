package vn.edu.hcmuaf.fit.beans;

public class SignUpObject {
    private String fullname;
    private String email;
    private String username;
    private String password;
    private String passwordEncrypted;

    public SignUpObject(String fullname, String email, String username, String password, String passwordEncrypted) {
        this.fullname = fullname;
        this.email = email;
        this.username = username;
        this.password = password;
        this.passwordEncrypted = passwordEncrypted;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordEncrypted() {
        return passwordEncrypted;
    }

    public void setPasswordEncrypted(String passwordEncrypted) {
        this.passwordEncrypted = passwordEncrypted;
    }

}
