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

@WebServlet("/register.do")
public class RegisterUser extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public RegisterUser() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Configuration config = new Configuration().configure();
        ServiceRegistry servRegist = new StandardServiceRegistryBuilder().applySettings(config.getProperties()).build();
        SessionFactory factory = config.buildSessionFactory(servRegist);
        Session session = factory.openSession();
        session.beginTransaction();
        
    
        
        // Hash della password
        String plainPassword = request.getParameter("password");
        String hashedPassword = BCrypt.hashpw(plainPassword, BCrypt.gensalt());
        String role = "USER"; // Imposta il ruolo di default per un nuovo utente
        
        // Controlla se è il primo utente registrato
        long userCount = (long) session.createQuery("SELECT COUNT(*) FROM User").uniqueResult();
        if (userCount == 0) {
            role = "ADMIN"; // Il primo utente è un amministratore
        }
        
        User user = new User(request.getParameter("nome"), request.getParameter("cognome"), request.getParameter("email"), hashedPassword, role);
        session.save(user);
        session.getTransaction().commit();
        
        session.close();
        
        response.sendRedirect("./login.jsp");
    }
}
