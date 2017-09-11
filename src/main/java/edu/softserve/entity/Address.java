package edu.softserve.entity;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
/**
 * Main purpose of Address entity is to bind every {@code User}, {@code Owner}
 * and {@code Resource} to a particular location.
 */
public class Address {

    private int id;
    private String country;
    private String region;
    private String district;
    private String postalIndex;
    private String locality;
    private String street;
    private int building;
    private String block;
    private int apartment;

    public Address setCountry(String country) {
        this.country = country;
        return this;
    }

    public Address setRegion(String region) {
        this.region = region;
        return this;
    }

    public Address setDistrict(String district) {
        this.district = district;
        return this;
    }

    public Address setPostalIndex(String postalIndex) {
        this.postalIndex = postalIndex;
        return this;
    }

    public Address setLocality(String locality) {
        this.locality = locality;
        return this;
    }

    public Address setStreet(String street) {
        this.street = street;
        return this;
    }

    public Address setBuilding(int building) {
        this.building = building;
        return this;
    }

    public Address setBlock(String block) {
        this.block = block;
        return this;
    }

    public Address setApartment(int apartment) {
        this.apartment = apartment;
        return this;
    }

}

