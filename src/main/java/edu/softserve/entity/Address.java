package edu.softserve.entity;


import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
@Builder

@Entity
/**
 * Main purpose of Address entity is to bind every {@code User}, {@code Owner}
 * and {@code Resource} to a particular location.
 */
public class Address {

    @Id()
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @JsonProperty("country")
    private String country;

    @JsonProperty("region")
    private String region;

    @JsonProperty("district")
    private String district;

    @JsonProperty("postal index")
    private String postalIndex;

    @JsonProperty("locality")
    private String locality;

    @JsonProperty("street")
    private String street;

    @JsonProperty("building")
    private int building;

    @JsonProperty("block")
    private String block;

    @JsonProperty("apartment")
    private int apartment;

}

