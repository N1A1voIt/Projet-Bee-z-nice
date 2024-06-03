package itu.project.beezniceback.authentification.dto;

import itu.project.beezniceback.utils.security.PasswordEncryption;

import java.security.NoSuchAlgorithmException;

public class LoginDTO {
    String mail;
    String password;

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) throws NoSuchAlgorithmException {
        this.password = PasswordEncryption.encryptToSHA256(password);
    }
}
