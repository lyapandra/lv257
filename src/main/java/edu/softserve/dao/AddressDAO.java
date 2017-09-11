package edu.softserve.dao;

import edu.softserve.entity.Address;

public interface AddressDAO {

    void addAddress(Address address);

    Address getAddressById(int id);

    void deleteAddress(Address address);

}
