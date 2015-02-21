package model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class User {

    private int userid;
    private List<Integer> booksInBag = new ArrayList<Integer>(); 
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
    public List<Integer> getBooksInBag(){
    	if(booksInBag != null){
    		System.out.println("User: booksInBag: "+ booksInBag.size());
    		return this.booksInBag;
    	} else {
    		System.out.println("booksInBag was NULL");
    		return null;
    	}
    }
    public boolean addBookToBag(Integer bookID){
    	// Check that we have a valid bookID
    	if(bookID >= 0){
    		this.booksInBag.add(bookID);
    		System.out.println("Added book to bag: " + booksInBag.size());
    		return true;
    	}
    	return false; // Not a valid bookID
    }
    public boolean removeBookFromBag(Integer bookID){
    	// Check that we have a valid bookID
    	if(bookID >= 0){
    		this.booksInBag.remove(bookID);
    		System.out.println("REMOVED book from bag: " + booksInBag.size());
    		return true;
    	}
    	return false; // Not a valid bookID
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

