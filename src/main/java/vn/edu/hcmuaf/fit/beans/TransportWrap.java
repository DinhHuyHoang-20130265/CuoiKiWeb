package vn.edu.hcmuaf.fit.beans;

import com.fasterxml.jackson.annotation.JsonProperty;

public class TransportWrap {
    private String message;
    @JsonProperty("Transport")
    private Transport transport;

    public TransportWrap() {
    }

    public TransportWrap(String message, Transport transport) {
        this.message = message;
        this.transport = transport;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Transport getTransport() {
        return transport;
    }

    public void setTransport(Transport transport) {
        this.transport = transport;
    }
}
