package model;

import java.util.Date;

public class User {

    private int userid;
    private String firstName;
    private String lastName;
    private Date dob;
    private String email;
    private String password;
    private boolean isAdmin = true; // For now, all users are admins
    private String ADMIN_NAME = "admin";
    private String ADMIN_PASS = "pass";

    public int getUserid() {
        return userid;
    }
    public void setUserid(int userid) {
        this.userid = userid;
    }
    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return lastName;
    }
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public Date getDob() {
        return dob;
    }
    public void setDob(Date dob) {
        this.dob = dob;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword(){
    	return password;
    }
    public void setPassword(String password){
    	this.password = password;
    }
    public boolean isAdminName(String username){
    	return username.equals(ADMIN_NAME);
    }
    public boolean isAdminPassword(String password){
    	return password.equals(ADMIN_PASS);
    }
    public boolean isAdmin(){
//    	System.out.println("uName: " + uName + " -- " + "uPass: " + uPass);
//    	return isAdminName(uName) && isAdminPassword(uPass);
    	return this.isAdmin;
    }

    @Override
    public String toString() {
        return "User [userid=" + userid + ", firstName=" + firstName
                + ", lastName=" + lastName + ", dob=" + dob + ", email="
                + email + ", password=" + password + "]";
    }    
}

