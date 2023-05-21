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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServelet
 */

@WebServlet("/login")
public class LoginServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
		/* Retrieves the parameters from the client */
		
        String username = request.getParameter("uname");
        String email = request.getParameter("mail");
        String pass = request.getParameter("psw");
   
        try {
        	
        	/* Sets the database connection */
        	
            Class.forName("com.mysql.cj.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/ocms", "root", "ithinkiseeu5020");
            
            
            /* Prepares and executes a query using the input values
             	and fetches information from 'users' table in database*/
            
            String query = "SELECT * FROM users WHERE username = ? AND email = ? AND pass = ?";

            PreparedStatement ps = con.prepareStatement(query);
             
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, pass);
            
            /* Creates a session and keep the current user's email */ 
			
			HttpSession session=request.getSession();
			session.setAttribute("Email",email);
			
           
            ResultSet rs = ps.executeQuery();
            
            /* If credentials match and produces output */
            
            if(rs.next()) {
            	
            	/* Retrieves the user's type */
            	
            	String t = rs.getString("usertype");
            	
            	if(t.equals("student")) {
            		
            		/* If user is a student */ 
            		
            		request.getRequestDispatcher("StudentHome.jsp").forward(request,response);
            		
            	}
            	else if(t.equals("teacher")) {

            		/* If user is a teacher */ 
            		
            		request.getRequestDispatcher("TeacherHome.jsp").forward(request,response);
            		
            	}
            	else if(t.equals("admin")) {
            		
            		/* If user is an admin */ 
            		
            		request.getRequestDispatcher("AdminHome.jsp").forward(request,response);
            		
            	}
            	
            	/* Keeps the user's type */ 
            	session.setAttribute("Usertype", t);
                
            }
            
            /* If credentials don't match and error occurs */ 
            
            else {
            	request.getSession().setAttribute("ErrorString", "Wrong Credentials!");
            	request.getRequestDispatcher("Error.jsp").forward(request,response);
            }
                  
        } catch (Exception e2) {
        	request.getSession().setAttribute("ErrorString", "There's an error. That's all we know :(");
        	request.getRequestDispatcher("Error.jsp").forward(request,response);
            System.out.println(e2);
        } 
	}
}
