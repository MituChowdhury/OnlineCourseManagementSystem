package ocms;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StudentServlet
 */

@WebServlet("/show student")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		/* Retrieves the coursename from the client */
		
		String cname = request.getParameter("cname");
		
		try {
			
			/* Sets the database connection */
			
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    java.sql.Connection con = DriverManager.getConnection(
		            "jdbc:mysql://localhost:3306/ocms", "root", "ithinkiseeu5020");
		    
		    /* Prepares and executes a query using the coursename 
		       and fetches information from the join operation of 'takes' and 
		       'students' table in database */
		    
		    String query = (
		    		"SELECT * FROM takes join students on takes.username = students.username WHERE coursename = ?");

		    PreparedStatement ps = con.prepareStatement(query);
		    
		    ps.setString(1, cname);

		    ResultSet rs = ps.executeQuery();
		    
		    /* Keeps the produced Resultset from the query 
		       and send it to StudentList.jsp file */
		    
		    request.getSession().setAttribute("Resultset", rs);
		    
		    request.getRequestDispatcher("StudentList.jsp").forward(request,response);
		    
		} catch (Exception e2) {
			
			/* If any error occurs displays the error message */
			
			request.getSession().setAttribute("ErrorString", "There's an error. That's all we know :(");
        	request.getRequestDispatcher("Error.jsp").forward(request,response);
	    	System.out.println(e2);
		}
	}
}
