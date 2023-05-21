package ocms;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddCourseServlet
 */
@WebServlet("/add course")
public class AddCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* Retrieves the parameters from the client */
		
		String coursetitle = request.getParameter("ctitle");
		String coursecode = request.getParameter("ccode");
		String credit = request.getParameter("ccredit");
		String teacher = request.getParameter("ctname");
		String email = request.getParameter("ctmail");
		
		try {
			
			/* Sets the database connection */
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/ocms", "root", "ithinkiseeu5020");
			
			/* Prepares and executes the query by using the input values 
			 	and adds a course into the 'courses' table in database */
			
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO courses (coursecode, coursename, credit, courseteachername, courseteacheremail) VALUES (?, ?, ?, ?, ?)");
			
			ps.setString(1, coursecode);
			ps.setString(2, coursetitle);
			ps.setString(3, credit);
			ps.setString(4, teacher);
			ps.setString(5, email);
			
			int i = ps.executeUpdate();
			
			/* If query is successful */
			
			if(i == 1){
				response.sendRedirect("CourseList.jsp");
			}
			
			/* If any error occurs because of duplicate entry in the database
				Sends the probable error string to the error page for display */
			
			else {
				request.getSession().setAttribute("ErrorString", "Adding Course Failed! This course might already be added.");
            	request.getRequestDispatcher("Error.jsp").forward(request,response);
			}
		} catch (Exception e2) {
			request.getSession().setAttribute("ErrorString", "Adding Course Failed! This course might already be added.");
        	request.getRequestDispatcher("Error.jsp").forward(request,response);
            System.out.println(e2);
        }
	}
}
