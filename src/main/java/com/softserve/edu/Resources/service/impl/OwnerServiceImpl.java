package com.softserve.edu.Resources.service.impl;

import com.softserve.edu.Resources.dao.OwnerDAO;
import com.softserve.edu.Resources.dto.OwnerDTO;
import com.softserve.edu.Resources.dto.SearchDTO;
import com.softserve.edu.Resources.dto.ValidationErrorDTO;
import com.softserve.edu.Resources.entity.Owner;
import com.softserve.edu.Resources.entity.Person;
import com.softserve.edu.Resources.service.OwnerService;
import com.softserve.edu.Resources.util.QueryBuilder;
import com.softserve.edu.Resources.util.ValidationDTOUtility;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;

import java.lang.invoke.MethodHandles;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class OwnerServiceImpl implements OwnerService {

    static final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass().getName());

    @Autowired
    private OwnerDAO ownerDAO;

    @Autowired
    private ValidationDTOUtility validationUtility;

    @Autowired
    private QueryBuilder queryBuilder;

    @Override
    public Owner addOwner(Owner owner) {
        logger.trace("Saving owner:" + owner);

        return ownerDAO.makePersistent(owner);
    }

    @Override
    public void updateOwner(Owner owner) {
        logger.trace("Updating owner:" + owner);

        ownerDAO.makePersistent(owner);
    }

    @Override
    public void deleteOwnerById(Long id) {
        logger.trace("Deleting owner with id:" + id);

        ownerDAO.deleteOwnerById(id);
    }

    @Override
    public List<Owner> getAllCompanies() {
        logger.trace("Retrieving all the companies");

        return ownerDAO.getAllCompanies();
    }

    @Override
    public List<Owner> getAllPersons() {
        logger.trace("Retrieving all the persons");

        return ownerDAO.getAllPersons();
    }

    @Override
    public List<Owner> getAllOwners() {
        logger.trace("Retrieving all the owners");

        return ownerDAO.findAll();
    }

    @Override
    public Owner getOwnerById(long id) {
        logger.trace("Retrieving owner by id:" + id);

        return ownerDAO.findById(id).orElse(new Person());
    }

    /**
     * Builds dto with fields common to each owner type.
     * All owner type specific info is stored in personalInfo field.
     *
     * @param owners - owners list
     * @return list of owner dtos
     */
    @Override
    public List<OwnerDTO> fromOwnerToOwnerDto(List<Owner> owners) {
        logger.info("Building OwnerDTO list");

        List<OwnerDTO> ownerDTOS = new ArrayList<>();
        final OwnerDTO[] ownerDTO = new OwnerDTO[1];

        owners.forEach(owner -> {
            ownerDTO[0] = new OwnerDTO();
            ownerDTO[0].setOwnerId(owner.getId())
                    .setOwnerType(owner.ownerType())
                    .setPhone(owner.getPhone())
                    .setAddressInfo(owner.addressInfo())
                    .setPersonalInfo(owner.customToString());

            ownerDTOS.add(ownerDTO[0]);
        });
//        for (Owner owner: owners) {
//            ownerDTO[0] = new OwnerDTO();
//            ownerDTO[0].setOwnerId(owner.getId())
//                    .setOwnerType(owner.ownerType())
//                    .setPhone(owner.getPhone())
//                    .setAddressInfo(owner.addressInfo())
//                    .setPersonalInfo(owner.customToString());
//
//            ownerDTOS.add(ownerDTO[0]);
//        }
        return ownerDTOS;
    }

    @Override
    public List<Owner> findOwners(SearchDTO searchDTO) {
        String readyQuery = queryBuilder.buildQuery(searchDTO);

        if (readyQuery.isEmpty()){
            return new ArrayList<>();
        }
        return ownerDAO.findOwners(readyQuery);
    }

    @Override
    public ValidationErrorDTO validationDTO(BindingResult result) {
        logger.trace("Validating owner with errors in fields:" + result.getFieldErrors());

        return validationUtility.getErrorDTO(result);
    }
}
