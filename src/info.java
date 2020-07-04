

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class info
 */
@WebServlet("/info")
public class info extends HttpServlet {
	PreparedStatement ps=null;
	Connection con;
	ResultSet rs;
	String msg;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public info() {
        super();
        // TODO Auto-generated constructor stub
    }
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		PrintWriter print=response.getWriter();
	   		String name=request.getParameter("name");
	   		String password=request.getParameter("password");
	   	String sql="select * from info where name=? and password=?";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/emp","root","root");
		
			//String sql="select * from info where name=? and password=?";
		 ps=con.prepareStatement(sql);	
		 ps.setString(1, name);
		 ps.setString(2, password);
		 rs=ps.executeQuery();
		while(rs.next()) {
			String n=rs.getString(1);
			String psd=rs.getString(2);
			String address=rs.getString(3);
			String email=rs.getString(4);
			if( n.equals(name) && psd.equals(password)) {
				print.println("Hello Roopali");
				print.println("<html>");
				print.println("<body>");
				print.println("<table>");
				
				print.println("<tr>");
;				print.println("<td>"+n+"</td>");
				print.println("<td>"+psd+"</td>");
				print.println("<td>"+address+"</td>");
				print.println("<td>"+email+"</td>");
				print.println("</tr>");
				
			}
			else {
				print.println("wrong credentials");
			}
		}
		print.println("</table>");
		print.println("</body>");
		print.println("</html>");
		}
		catch(SQLException s) {
			s.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}

	
}
