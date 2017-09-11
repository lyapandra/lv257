package edu.softserve.dao.impl;

import edu.softserve.dao.AddressDAO;
import edu.softserve.entity.Address;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Repository
public class AddressDAOImpl implements AddressDAO {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void addAddress(Address address) {
        entityManager.persist(address);
    }

    @Override
    public Address getAddressById(int id) {
        Query query = entityManager.createQuery("SELECT a FROM Address a WHERE id = :id");
        Address address = (Address)query.setParameter("id", id)
                .getSingleResult();
        return address;
    }

    @Override
    public void deleteAddress(Address address) {
        // NOP
    }
}
