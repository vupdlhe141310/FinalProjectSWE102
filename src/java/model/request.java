
package model;

public class request {
    String username;
    String reason;
    String type;

    public request() {
    }

    public request(String username, String reason, String type) {
        this.username = username;
        this.reason = reason;
        this.type = type;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "request{" + "username=" + username + ", reason=" + reason + ", type=" + type + '}';
    }
    
}
