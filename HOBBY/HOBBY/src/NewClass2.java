

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NewClass2
 */
public class NewClass2 extends HttpServlet {
	private static final long serialVersionUID = 54656;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewClass2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.write("HI from post baby <br>");
		String parameter[] ={"new_user","new-pass_word","name","year","month","date","gender","FISHING","SWIMMING","OTHERS"};
		for(int i=0;i<parameter.length;i++)
			out.write(parameter[i]+"  \t\t  "+request.getParameter(parameter[i])+"<br>");
	}

}
