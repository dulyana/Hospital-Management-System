/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Dulani Anupama
 */
public class user {
    dbcon con = new dbcon();
    
    public boolean verifyUser(String name, String password){//Read
        boolean verified = false;
        
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select * from loginpa where name = ?");
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next() && password.equals(rs.getString("password"))){
                verified = true;
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return verified;
}

    public boolean registerUser(String name, String number, String email, String gender, String dob, String password, String repassword, String address, String city, String decesed, String blood) {
        //throw new UnsupportedOperationException("Not supported yet.");
        //To change body of generated methods, choose Tools | Templates.
        
       int result = 0;
        
        try {
            PreparedStatement ps = con.createConnection().prepareStatement("insert into regpa(name,number, email,gender,dob,password, repassword,address,city,decesed,blood) values(?,?,?,?,?,?,? ?, ?,?,?)");
            ps.setString(1, name);
            ps.setString(2, number);
            ps.setString(3, email);
             ps.setString(4, gender);
            ps.setString(5, dob);
            ps.setString(6, password);
             ps.setString(7, repassword);
            ps.setString(8, address);
            ps.setString(9, city);
             ps.setString(10,decesed);
            ps.setString(11, blood);
            
            
            result = ps.executeUpdate();
           
        } 
catch (Exception e) {
            e.printStackTrace();
        }
       /*finally{
            if(result>0)
                return true;
            else
                return false;
        }*/
        
        return result ==1;
        
        
    }

    
public boolean verifyUser1(String name, String password){//Read
        boolean verified = false;
        
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select * from loginadmin where name = ?");
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next() && password.equals(rs.getString("password"))){
                verified = true;
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return verified;
}
 
public boolean registerUser1(String name, String number, String email, String gender, String dob, String password, String repassword, String address, String city) {
        //throw new UnsupportedOperationException("Not supported yet.");
        //To change body of generated methods, choose Tools | Templates.
        
       int result = 0;
        
        try {
            PreparedStatement ps = con.createConnection().prepareStatement("insert into regadmin(name,number, email,gender,dob,password, repassword,address,city) values(?,?,?,?,?,?,? ?, ?,?,?)");
            ps.setString(1, name);
            ps.setString(2, number);
            ps.setString(3, email);
             ps.setString(4, gender);
            ps.setString(5, dob);
            ps.setString(6, password);
             ps.setString(7, repassword);
            ps.setString(8, address);
            ps.setString(9, city);
            
            
            
            result = ps.executeUpdate();
           
        } 
catch (Exception e) {
            e.printStackTrace();
        }
       /*finally{
            if(result>0)
                return true;
            else
                return false;
        }*/
        
        return result ==1;
        
        
    }


public boolean verifyUser2(String name, String password){//Read
        boolean verified = false;
        
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select * from loginrec where name = ?");
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next() && password.equals(rs.getString("password"))){
                verified = true;
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return verified;
}
public boolean registerUser2(String name, String number, String email, String gender, String dob, String password, String repassword, String address, String city) {
        //throw new UnsupportedOperationException("Not supported yet.");
        //To change body of generated methods, choose Tools | Templates.
        
       int result = 0;
        
        try {
            PreparedStatement ps = con.createConnection().prepareStatement("insert into regrec(name,number, email,gender,dob,password, repassword,address,city) values(?,?,?,?,?,?,? ?, ?,?,?)");
            ps.setString(1, name);
            ps.setString(2, number);
            ps.setString(3, email);
             ps.setString(4, gender);
            ps.setString(5, dob);
            ps.setString(6, password);
             ps.setString(7, repassword);
            ps.setString(8, address);
            ps.setString(9, city);
            
            
            
            result = ps.executeUpdate();
           
        } 
catch (Exception e) {
            e.printStackTrace();
        }
       /*finally{
            if(result>0)
                return true;
            else
                return false;
        }*/
        
        return result ==1;
        
        
    }

public boolean verifyUser3(String name, String password){//Read
        boolean verified = false;
        
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select * from logindoc where name = ?");
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next() && password.equals(rs.getString("password"))){
                verified = true;
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return verified;
}

public boolean registerUser3(String name, String number, String email, String gender, String dob, String password, String repassword, String address, String specialization) {
        //throw new UnsupportedOperationException("Not supported yet.");
        //To change body of generated methods, choose Tools | Templates.
        
       int result = 0;
        
        try {
            PreparedStatement ps = con.createConnection().prepareStatement("insert into regdoc(name,number, email,gender,dob,password, repassword,address,specialization) values(?,?,?,?,?,?,? ?, ?,?,?)");
            ps.setString(1, name);
            ps.setString(2, number);
            ps.setString(3, email);
             ps.setString(4, gender);
            ps.setString(5, dob);
            ps.setString(6, password);
             ps.setString(7, repassword);
            ps.setString(8, address);
            ps.setString(9, specialization);
            
            
            
            result = ps.executeUpdate();
           
        } 
catch (Exception e) {
            e.printStackTrace();
        }
       /*finally{
            if(result>0)
                return true;
            else
                return false;
        }*/
        
        return result ==1;
        
        
    }
}

    
