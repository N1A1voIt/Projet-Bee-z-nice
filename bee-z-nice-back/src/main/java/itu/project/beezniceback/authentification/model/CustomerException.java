package itu.project.beezniceback.authentification.model;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.BAD_REQUEST)
public class CustomerException extends Exception{
    public CustomerException(){
        super();
    }

    public CustomerException(String message) {
        super(message);
    }

    public CustomerException(String message, Throwable cause) {
        super(message, cause);
    }

    public CustomerException(Throwable cause) {
        super(cause);
    }
}
