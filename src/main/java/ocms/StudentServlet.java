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
     * @see HttpServlet#HttpServlet()
     */
    public StudentServlet() {
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
		//doGet(request, response);
		String cname = request.getParameter("cname");
		
		try {
			
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    java.sql.Connection con = DriverManager.getConnection(
		            "jdbc:mysql://localhost:3306/ocms", "root", "ithinkiseeu5020");
		    
		    String query = (
		    		"SELECT * FROM takes join students on takes.username = students.username WHERE coursename = ?");

		    PreparedStatement ps = con.prepareStatement(query);
		    
		    ps.setString(1, cname);

		    ResultSet rs = ps.executeQuery();
		    
		    request.getSession().setAttribute("Resultset", rs);
		    
		    request.getRequestDispatcher("StudentList.jsp").forward(request,response);
		    
		} catch (Exception e2) {
	    	System.out.println(e2);
		}
	}
}
