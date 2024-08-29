package com.app.library;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Order;
import org.hibernate.query.Query;
import org.hibernate.service.ServiceRegistry;

@WebServlet(description = "Gestione Utenti", urlPatterns = { "/UserList" })
public class UserList extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private SessionFactory factory;

    public UserList() {
        super();
    }

    @Override
    public void init() {
        Configuration conf = new Configuration().configure();
        ServiceRegistry servReg = new StandardServiceRegistryBuilder().applySettings(conf.getProperties()).build();
        factory = conf.buildSessionFactory(servReg);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("update".equalsIgnoreCase(action)) {
            updateUser(request, response);
        } else if ("delete".equalsIgnoreCase(action)) {
            deleteUser(request, response);
        } else {
            doGet(request, response); // Per recuperare l'elenco degli utenti o gestire altre azioni
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Session session = factory.openSession();
        try {
            session.beginTransaction();
            Criteria criteria = session.createCriteria(User.class);
            criteria.addOrder(Order.asc("id"));
            List<User> users = criteria.list();
            session.getTransaction().commit();

            if (users.isEmpty()) {
                System.out.println("No users found in the database.");
            }

            request.setAttribute("users", users);
            request.getRequestDispatcher("adminpage.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving user list");
        } finally {
            session.close();
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String newNome = request.getParameter("nome");
        String newCognome = request.getParameter("cognome");

        Session session = factory.openSession();
        boolean success = false;
        
        try {
            session.beginTransaction();
            User user = (User) session.get(User.class, userId); // Cast esplicito a User
            if (user != null) {
                user.setNome(newNome);
                user.setCognome(newCognome);
                session.update(user);
                session.getTransaction().commit();
                success = true;
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating user");
            return;
        } finally {
            session.close();
        }

        if (success) {
            response.sendRedirect("UserList");
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));

        Session session = factory.openSession();
        boolean success = false;

        try {
            session.beginTransaction();
            User user = (User) session.get(User.class, userId); // Cast esplicito a User
            if (user != null) {
                session.delete(user);
                session.getTransaction().commit();
                success = true;
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error deleting user");
            return;
        } finally {
            session.close();
        }

        if (success) {
            response.sendRedirect("UserList");
        }
    }
}