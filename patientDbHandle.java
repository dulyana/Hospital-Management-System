/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.patient;

/**
 *
 * @author Dulani Anupama
 */
public class patientDbHandle {
    
    public static Connection getConnection(){  
        Connection con=null;  
        try{  
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
        
        }catch(Exception e){System.out.println(e);}  
        return con;  
    }  
    public static int Addpatient(patient p){  
        int status = 0;  
        try{  
            Connection con=patientDbHandle.getConnection();  
            PreparedStatement ps=con.prepareStatement( "insert into pamanage(name,email,number,decesed,bloodgroup,address) values (?,?,?,?,?,?)");  
            ps.setString(1,p.getName());  
            ps.setString(2,p.getEmail());  
            ps.setString(3,p.getNumber());  
            ps.setString(4,p.getDeseced()); 
            ps.setString(5,p.getBloodgroup());  
            ps.setString(6,p.getAddress());
              
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }  
    public static int update(patient p){  
        int status = 0;  
        try{  
            Connection con=patientDbHandle.getConnection();  
            PreparedStatement ps=con.prepareStatement(  
                         "update pamanage set name = ?,email= ?,number= ?,decesed= ?,bloodgroup= ?,address= ? where id=?"); //id pk,ai 
            ps.setString(1,p.getName());  
            ps.setString(2,p.getEmail());  
            ps.setString(3,p.getNumber());  
            ps.setString(4,p.getDeseced()); 
            ps.setString(5,p.getBloodgroup());  
            ps.setString(6,p.getAddress());
           ps.setInt(7,p.getId());
              
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }  
    public static int delete(int id){  
        int status = 0;  
        try{  
            Connection con=patientDbHandle.getConnection();  
            PreparedStatement ps=con.prepareStatement("delete from pamanage where id=?");  
            ps.setInt(1,id);  
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
          
        return status;  
    }  
    /*public static Emp getEmployeeById(int id){  
        Emp e=new Emp();  
          
        try{  
            Connection con=EmpDBHandler.getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from emp_management where id=?");  
            ps.setInt(1,id);  
            ResultSet rs=ps.executeQuery();  
            if(rs.next()){  
                e.setId(rs.getInt(1));  
                e.setName(rs.getString(2));  
                e.setPassword(rs.getString(3));  
                e.setEmail(rs.getString(4));  
                e.setCountry(rs.getString(5));  
            }  
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return e;  
    }  */
    public static List<patient> getAllPatients(){  
        List<patient> list=new ArrayList<patient>();  
          
        try{  
            Connection con=patientDbHandle.getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from pamanage");  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                patient p=new patient();
                ps.setInt(1,p.getId());
                ps.setString(2,p.getName());  
            ps.setString(3,p.getEmail());  
            ps.setString(4,p.getNumber());  
            ps.setString(5,p.getDeseced()); 
            ps.setString(6,p.getBloodgroup());  
            ps.setString(7,p.getAddress());
              
                list.add(p);  
            }  
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
          
        return list;  
    }
    /*
      public static List<Emp> getRecords(int start,int total){  
        List<Emp> list=new ArrayList<Emp>();  
        try{  
            Connection con=getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from emp_management limit "+(start-1)+","+total);  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                Emp e=new Emp();  
                e.setId(rs.getInt(1));  
                e.setName(rs.getString(2));  
                e.setEmail(rs.getString(4));  
                list.add(e);  
            }  
            con.close();  
        }catch(Exception e){System.out.println(e);}  
        return list;  
    }  
} */ 
}
