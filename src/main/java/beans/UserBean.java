package beans;

import java.io.Serializable;

public class UserBean implements Serializable {
    private int id;
    private String user;
    private String password;

    public UserBean(){
        id = 0;
        user = "";
        password = "";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}