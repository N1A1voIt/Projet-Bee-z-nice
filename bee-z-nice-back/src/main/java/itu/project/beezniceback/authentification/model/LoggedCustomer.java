package itu.project.beezniceback.authentification.model;

import java.io.Serializable;

public class LoggedCustomer implements Serializable {
    private long id;
    private String firstName;
    private String name;
    private String mail;
    private boolean isActive;
    private String uniqId;
    private int idEstablishement;
    private boolean isAdmin;
    public LoggedCustomer(long id, String firstName, String name, String mail, boolean isActive, String uniqId, int idEstablishement,boolean isAdmin) {
        this.id = id;
        this.firstName = firstName;
        this.name = name;
        this.mail = mail;
        this.isActive = isActive;
        this.uniqId = uniqId;
        this.idEstablishement = idEstablishement;
        this.isAdmin = isAdmin;
    }
    public LoggedCustomer(Customer customer){
        this.id = customer.getId();
        this.firstName = customer.getFirstName();
        this.name = customer.getName();
        this.mail = customer.getMail();
        this.isActive = customer.isActive();
        this.uniqId = customer.getUniqId();
        this.idEstablishement = customer.getIdEstablishement();
        this.isAdmin = customer.getIsAdmin();
    }
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public boolean getIsActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public String getUniqId() {
        return uniqId;
    }

    public void setUniqId(String uniqId) {
        this.uniqId = uniqId;
    }

    public int getIdEstablishement() {
        return idEstablishement;
    }

    public void setIdEstablishement(int idEstablishement) {
        this.idEstablishement = idEstablishement;
    }

    public boolean getIsAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

    @Override
    public String toString() {
        return "LoggedCustomer{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", name='" + name + '\'' +
                ", mail='" + mail + '\'' +
                ", isActive=" + isActive +
                ", uniqId='" + uniqId + '\'' +
                ", idEstablishement=" + idEstablishement +
                ", isAdmin=" + isAdmin +
                '}';
    }
}
