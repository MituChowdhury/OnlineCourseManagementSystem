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
 * Servlet implementation class LoginServelet
 */
@WebServlet("/login")
public class LoginServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServelet() {
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
		//response.setContentType("text/html");
 
        String username = request.getParameter("uname");
        String email = request.getParameter("mail");
        String pass = request.getParameter("psw");
   
        try {
        	
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/ocms", "root", "ithinkiseeu5020");
            
            
            //check if credentials match
            String query = "SELECT * FROM users WHERE username = ? AND email = ? AND pass = ?";

            PreparedStatement ps = con.prepareStatement(query);
 
            //compared email and password
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, pass);
            
            //create a session and keep the email into Email caiable
			/*
			 * HttpSession session=request.getSession();
			 * session.setAttribute("Email",email);
			 */
           
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()) {
            	//Retrieve the user's type who is trying to login
            	String t = rs.getString("usertype");
            	///System.out.println("hiii" + t);
            	if(t.equals("student")) {
            		System.out.println("student");
            		//if any student try to login then 
            		//request.getRequestDispatcher("StudentHome.jsp").forward(request,response);
            		
            	}
            	else if(t.equals("teacher")) {
            		System.out.println("teacher");
            		//if any teacher try to login then
            		//request.getRequestDispatcher("TeacherHome.jsp").forward(request,response);
            		
            	}
            	else if(t.equals("admin")) {
            		System.out.println("admin");
            		//if admin try to login then
            		request.getRequestDispatcher("AdminHome.jsp").forward(request,response);
            		
            	}
                
            }
            //if anyone enter wrong email or password
            else {
            	response.sendRedirect("Login.jsp");
            }
                  
        } catch (Exception e2) {
            System.out.println(e2);
        } 
	}
}
