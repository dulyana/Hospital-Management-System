/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

/**
 *
 * @author Dulani Anupama
 */
public class patient {
private int id;    
private String name,email,number,deseced,bloodgroup,address; 

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getNumber() {
        return number;
    }

    public String getDeseced() {
        return deseced;
    }

    public String getBloodgroup() {
        return bloodgroup;
    }

    

    

    public String getAddress() {
        return address;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public void setDeseced(String deseced) {
        this.deseced = deseced;
    }

    public void setBloodgroup(String bloodgroup) {
        this.bloodgroup = bloodgroup;
    }

    

    public void setAddress(String address) {
        this.address = address;
    }




}
