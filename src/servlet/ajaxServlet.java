package servlet;
import com.fasterxml.jackson.databind.ObjectMapper;
import dao.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ajax1")
public class ajaxServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("uname");
        System.out.println("收到请求"+name);
        User user = new User("张三","123");
        User user2 = new User("张三","123");
        List<User> list = new ArrayList<>();
        list.add(user);
        list.add(user2);
        System.out.println(user.toString());

        ObjectMapper mapper = new ObjectMapper();

        resp.getWriter().write("11");
    }
}
