package com.bank.controller;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("manage")
public class BankEndpoint {

    //private static final Logger logger = LoggerFactory.getLogger(BankEndpoint.class);

//    private final Tracer tracer;
//
//    @Inject
//    public BankEndpoint(Tracer tracer) {
//        this.tracer = tracer;
//    }

    @GET
    @Path("{account}")
    @Produces(MediaType.APPLICATION_JSON)
    public String getAmount(@PathParam("account") String account) {

//        Span trace = tracer.activeSpan();
//
//        trace.log("Bank ask for amount for the account:" + account);

        return "Amount V4 " + account;
    }
}
