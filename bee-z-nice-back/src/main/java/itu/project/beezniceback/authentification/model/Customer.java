package itu.project.beezniceback.authentification.model;

import jakarta.persistence.*;

@Entity
@Table(name = "customers")
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;
    @Column(name = "firstname")
    private String firstName;
    @Column(name = "name")
    private String name;
    @Column(name = "mail")
    private String mail;
    @Column(name = "password")
    private String password;
    @Column(name = "isactive")
    private boolean isActive;
    @Column(name = "uniqid")
    private String uniqId;
    @Column(name = "idestablishment")
    private int idEstablishement;
    @Column(name = "isadmin")
    private boolean isAdmin;

    public boolean getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public Customer(long id, String firstName, String name, String mail, String password, boolean isActive, String uniqId, int idEstablishement,boolean isAdmin) {
        this.id = id;
        this.firstName = firstName;
        this.name = name;
        this.mail = mail;
        this.password = password;
        this.isActive = isActive;
        this.uniqId = uniqId;
        this.idEstablishement = idEstablishement;
        this.isAdmin = isAdmin;
    }

    public Customer() {

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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isActive() {
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
}
