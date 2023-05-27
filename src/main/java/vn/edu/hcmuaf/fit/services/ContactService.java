package vn.edu.hcmuaf.fit.services;


import vn.edu.hcmuaf.fit.DAO.ContactDAO;
import vn.edu.hcmuaf.fit.DAO.NewsCommentDAO;
import vn.edu.hcmuaf.fit.beans.contact.Contact;

import java.util.List;

public class ContactService {
    private static ContactService contactService;

    public static ContactService getInstance() {
        if (contactService == null) {
            contactService = new ContactService();
        }
        return contactService;
    }
    public List<Contact> getAllContact() {
        return ContactDAO.getAllContact();
    }
    public List<Contact> loadContactWithPage(int page){
        return new ContactDAO().loadContactWithPage(page);
    }
    public List<Contact> loadNewestContacts(){
        return new ContactDAO().loadNewestContact();
    }
    public String addNewContact(String name, String email,String phone,String content) {
        ContactDAO DAO = new ContactDAO();
        return DAO.addNewContact(name, email, phone,content);
    }
    public void removeContact(String id) {
        ContactDAO DAO = new ContactDAO();
        DAO.removeContact(id);
    }

    public Contact getContentById(String id) {
        ContactDAO DAO = new ContactDAO();
        return DAO.getContactById(id);
    }
    public List<Contact> loadReplyContactWithPage(int page){
        return new ContactDAO().loadReplyContactWithPage(page);
    }
}

