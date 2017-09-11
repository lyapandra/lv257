package edu.softserve.controller;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import edu.softserve.entity.Address;
import edu.softserve.entity.ResourceProperty;
import edu.softserve.service.AddressService;
import edu.softserve.service.ResourceTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@org.springframework.web.bind.annotation.RestController
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
    }
    @RequestMapping(value = "/add_address_stub", method = RequestMethod.GET)
    public String getResourceProperties() {
        Address ukraine = Address.builder()
                .country("Ukraine")
                .building(15)
                .build();
        addressService.addAddress(ukraine);
        return "resources";
    }
    @RequestMapping(value = "/get_address_by_id", method = RequestMethod.GET)
    public String getAddressById() {
        return addressService.getAddressById(1).toString();
    }

}
