package edu.softserve.controller;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import edu.softserve.entity.Address;
import edu.softserve.entity.ResourceProperty;
import edu.softserve.service.AddressService;
import edu.softserve.service.ResourceTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.List;

@Controller
public class RestResourceController {

    @Autowired
    private ResourceTypeService resourceTypeService;
    @Autowired
    private AddressService addressService;

    @ResponseBody
    @RequestMapping(value = "/resources/characteristics", method = RequestMethod.POST)
    public String getResourceProperties(@RequestBody String data) {
        System.out.println("Data recieved from client to find properties for: " + data);
        List<ResourceProperty> propertiesStab = resourceTypeService.getPropertiesStab(data);
        ObjectMapper objectMapper = new ObjectMapper();
        String json = "";
        try {
            json = objectMapper.writeValueAsString(propertiesStab);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return "{\"rP\":" + json + "}";
//        return json;
    }

    @ResponseBody
    @RequestMapping(value = "/resources/address", method = RequestMethod.POST)
    public String saveResourceAddress(@RequestBody String json) {
        Address address = null;
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            address = objectMapper.readValue(json, Address.class);
            addressService.addAddress(address);
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (address == null){
            return "fail";
        }
        System.out.println(address);
        return "";
    }

}
