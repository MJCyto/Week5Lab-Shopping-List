package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mjjmk
 */
public class ShoppingListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("user") != null) {
            getServletContext().getRequestDispatcher("/WEB-INF/shoppingList.jsp").forward(request, response);
            return;
        }

        getServletContext().getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String action = (String) request.getParameter("action");
        
        switch (action) {
            case "register": {
                String uName = request.getParameter("name");
                ArrayList<String> list = new ArrayList<>();
                session.setAttribute("list", list);
                session.setAttribute("user", uName);
                break;
            }
            case "add": {
                ArrayList<String> list = (ArrayList<String>) session.getAttribute("list");
                list.add(request.getParameter("itemName"));
                session.setAttribute("list", list);
                break;
            }
            case "delete": {
                ArrayList<String> list = (ArrayList<String>) session.getAttribute("list");
                for (int i = 0; i < list.size(); i++) {
                    if (request.getParameter("listItem").equals(list.get(i))) {
                        list.remove(i);
                    }
                }
                session.setAttribute("list", list);
                break;
            }
            case "logout": {
                session.invalidate();
                getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
                return;
            }
        }
        getServletContext().getRequestDispatcher("/WEB-INF/shoppingList.jsp").forward(request, response);
    }
}
