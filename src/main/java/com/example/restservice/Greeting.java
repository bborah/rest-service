package com.example.restservice;

public class Greeting {

    private final long id;
    private final String message;

    public Greeting(long id, String message){
        this.id = id;
        this.message = message;
    }
    

    public long getId(){
        return this.id;
    }

    public String getMessage(){
        return this.message;
    }

}
