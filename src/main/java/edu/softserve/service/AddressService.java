package edu.softserve.service;

import edu.softserve.dao.AddressDAO;
import edu.softserve.entity.Address;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AddressService {

    @Autowired
    private AddressDAO addressDAO;

    public void addAddress(Address address) {
        addressDAO.addAddress(address);
    }

    public Address getAddressById(int id) {
        return addressDAO.getAddressById(id);
    }
}
