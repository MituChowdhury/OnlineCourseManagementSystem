package ocms;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EnrollServelet
 */

@WebServlet("/enroll")
public class EnrollServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* Retrieves the parameters from the client */
		
		 String code = request.getParameter("ccode");
		 String title = request.getParameter("ctitle");
		 
		 /* Using session get the current user's email */
		 
		 String email = (String)request.getSession(false).getAttribute("Email");
		 
		 try {
			 
			 	/* Sets the database connection */
			 
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            java.sql.Connection con = DriverManager.getConnection(
	                    "jdbc:mysql://localhost:3306/ocms", "root", "ithinkiseeu5020");
	 
	            /* Prepares and executes the query by using the email 
			 		and fetches information from 'students' table in database */
	            
	            String query = "SELECT * FROM students WHERE email = ?";

	            PreparedStatement ps = con.prepareStatement(query);
	 
	            ps.setString(1, email);
	           
	            ResultSet rs = ps.executeQuery();
	            
	            while(rs.next()) {
	            	
	            	/* If query is successful 
	            	   retrieves student data */
	            	
	            	String name = rs.getString("username");
	            	String reg = rs.getString("regno");
	            	
	            	try {
	          
	            		/* Prepares and executes the query by using the input values 
	    			 		and enrolls into desired course storing information in 'takes' table in database */
	            		
	                    PreparedStatement ps1= con
	                            .prepareStatement(
	                            		"INSERT INTO takes (username, regno, email, coursename, coursecode) values(?,?,?,?,?)");
	                    
	                    ps1.setString(1, name);
	                    ps1.setString(2, reg);
	                    ps1.setString(3, email);
	                    ps1.setString(4, title);
	                    ps1.setString(5, code);
	         
	                    int i = ps1.executeUpdate();
	                    
	                    /* If query is successful */
	                    
	                    if (i == 1) {
	                    	request.getRequestDispatcher("EnrolledCourseList.jsp").forward(request,response);
	                    }
	                    
	                    /* If any error occurs because of duplicate entry in the database
	    				Sends the probable error string to the error page for display */
	                    
	                    else{
	                    	request.getSession().setAttribute("ErrorString", "Enroll Failed! You might've already enrolled in this course.");
	                    	request.getRequestDispatcher("Error.jsp").forward(request,response);
	                    }
	                }catch (Exception e2) {
	                	request.getSession().setAttribute("ErrorString", "Enroll Failed! You might've already enrolled in this course.");
                    	request.getRequestDispatcher("Error.jsp").forward(request,response);
	                    System.out.println(e2);
	                }
	            }     
	        } catch (Exception e2) {
	        	request.getSession().setAttribute("ErrorString", "Enroll Failed! You might've already enrolled in this course.");
            	request.getRequestDispatcher("Error.jsp").forward(request,response);
	            System.out.println(e2);
	        }		
	}

}
