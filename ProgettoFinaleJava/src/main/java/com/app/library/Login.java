package com.app.library;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import org.mindrot.jbcrypt.BCrypt; // Importa BCrypt

@WebServlet("/login.co")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public Login() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Configuration conf = new Configuration().configure();
        ServiceRegistry servReg = new StandardServiceRegistryBuilder().applySettings(conf.getProperties()).build();
        SessionFactory factory = conf.buildSessionFactory(servReg);
        Session session = factory.openSession();
        session.beginTransaction();
        
        String email = request.getParameter("email");
        String plainPassword = request.getParameter("password");
        
        // Trova l'utente con l'email fornita
        String hql = "FROM User WHERE email = :email";
        org.hibernate.Query query = session.createQuery(hql);
        query.setParameter("email", email);
        User user = (User) query.uniqueResult();
        
        session.getTransaction().commit();
        session.close();
        
        // Verifica la password
        if(user != null && BCrypt.checkpw(plainPassword, user.getPassword())) {
            // Memorizza l'utente nella sessione
            request.getSession().setAttribute("user", user);
            
            // Controlla il ruolo dell'utente e reindirizza alla pagina appropriata
            if ("ADMIN".equals(user.getRole())) {
                response.sendRedirect("./adminpage.jsp");
            } else {
                response.sendRedirect("./booklist.jsp");
            }
        } else {
            response.sendRedirect("login.jsp?error=true");
        }
    }
}
