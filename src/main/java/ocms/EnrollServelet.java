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
     * @see HttpServlet#HttpServlet()
     */
    public EnrollServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/*
	 * protected void doGet(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { // TODO Auto-generated
	 * method stub
	 * response.getWriter().append("Served at: ").append(request.getContextPath());
	 * }
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		
		 String code = request.getParameter("ccode");
		 String title = request.getParameter("ctitle");
		 
		 //using session get the current user's email
		 String email = (String)request.getSession(false).getAttribute("Email");
		 
		 try {
	            Class.forName("com.mysql.jdbc.Driver");
	            java.sql.Connection con = DriverManager.getConnection(
	                    "jdbc:mysql://localhost:3306/ocms", "root", "ithinkiseeu5020");
	 
	            //Retrieve the information from student table of the current user
	            String query = "SELECT * FROM students WHERE email = ?";

	            PreparedStatement ps = con.prepareStatement(query);
	 
	            ps.setString(1, email);
	           
	            ResultSet rs = ps.executeQuery();
	            
	            while(rs.next()) {
	            	//Retrieve data
	            	String name = rs.getString("username");
	            	String reg = rs.getString("regno");
	            	
	            	try {
	          
	                   //insert those retrieved data into course_reg table
	                    PreparedStatement ps1= con
	                            .prepareStatement(
	                            		"INSERT INTO takes (username, regno, email, coursename, coursecode) values(?,?,?,?,?)");
	                    
	                    ps1.setString(1, name);
	                    ps1.setString(2, reg);
	                    ps1.setString(3, email);
	                    ps1.setString(4, title);
	                    ps1.setString(5, code);
	         
	                    int i = ps1.executeUpdate();
	                    
	                    if (i == 1) {
	                    	request.getRequestDispatcher("EnrolledCourseList.jsp").forward(request,response);
	                    }
	                    else{
	                    	//response.getWriter().printWriter().print("Registration Failled!");
	                    }
	                }catch (Exception e2) {
	                    System.out.println(e2);
	                }
	            }     
	        } catch (Exception e2) {
	            System.out.println(e2);
	        }		
	}

}
