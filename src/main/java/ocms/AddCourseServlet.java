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
     * @see HttpServlet#HttpServlet()
     */
    public AddCourseServlet() {
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
		
		String coursetitle = request.getParameter("ctitle");
		String coursecode = request.getParameter("ccode");
		String credit = request.getParameter("ccredit");
		String teacher = request.getParameter("ctname");
		String email = request.getParameter("ctmail");
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/ocms", "root", "ithinkiseeu5020");
			
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO courses (coursecode, coursename, credit, courseteachername, courseteacheremail) VALUES (?, ?, ?, ?, ?)");
			
			ps.setString(1, coursecode);
			ps.setString(2, coursetitle);
			ps.setString(3, credit);
			ps.setString(4, teacher);
			ps.setString(5, email);
			
			int i = ps.executeUpdate();
			
			if(i == 1){
				System.out.println("doneee");
				response.sendRedirect("CourseList.jsp");
			}
			else
				response.sendRedirect("AdminHome.jsp");
		} catch (Exception e2) {
            System.out.println(e2);
        }
	}
}
