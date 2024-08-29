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
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Order;
import org.hibernate.query.Query;
import org.hibernate.service.ServiceRegistry;

@WebServlet(description = "Lista Libri", urlPatterns = { "/BookList" })
public class BookList extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private SessionFactory factory;

    public BookList() {
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
            updateBook(request, response);
        } else if ("delete".equalsIgnoreCase(action)) {
            deleteBook(request, response);
        } else {
            doGet(request, response); // Per recuperare l'elenco dei libri o gestire altre azioni
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        Session session = factory.openSession();
        try {
            session.beginTransaction();
            Criteria criteria = session.createCriteria(Book.class);
            criteria.addOrder(Order.asc("id"));
            List<Book> books = criteria.list();
            session.getTransaction().commit();
            
            request.setAttribute("books", books);
            request.getRequestDispatcher("booklist.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving book list");
        } finally {
            session.close();
        }
    }

    private void updateBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        String newTitle = request.getParameter("title");
        String newAuthor = request.getParameter("author");

        Session session = factory.openSession();
        boolean success = false;
        
        try {
            session.beginTransaction();
            Book book = (Book) session.get(Book.class, bookId);
            if (book != null) {
                book.setTitolo(newTitle);
                book.setAutore(newAuthor);
                session.update(book);
                session.getTransaction().commit();
                success = true; // Indica che l'operazione è riuscita
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Book not found");
                return; // Uscita per evitare sendRedirect() dopo sendError()
            }
        } catch (Exception e) {
            e.printStackTrace();
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating book");
            return; // Uscita per evitare sendRedirect() dopo sendError()
        } finally {
            session.close();
        }

        if (success) {
            response.sendRedirect("BookList");
        }
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));

        Session session = factory.openSession();
        boolean success = false;

        try {
            session.beginTransaction();
            Book book = (Book) session.get(Book.class, bookId);
            if (book != null) {
                session.delete(book);
                session.getTransaction().commit();
                success = true; // Indica che l'operazione è riuscita
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Book not found");
                return; // Uscita per evitare sendRedirect() dopo sendError()
            }
        } catch (Exception e) {
            e.printStackTrace();
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error deleting book");
            return; // Uscita per evitare sendRedirect() dopo sendError()
        } finally {
            session.close();
        }

        if (success) {
            response.sendRedirect("booklist.jsp");
        }
    }
}
