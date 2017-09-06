package edu.softserve.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.*;

/*
*  ResourceType implements entity containing a set of
*  ResourceProperty that describe particular GenericResource
*
* */
@Getter
@Setter
@Entity
public class ResourceType {

    @Id
    private int id;
    private String typeName;
    private String tableName;
    //  private ResourceType parentType;
    @OneToMany(mappedBy = "resourceType")
    private List<ResourceProperty> properties;


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ResourceType that = (ResourceType) o;

        return typeName.equals(that.typeName);
    }

    @Override
    public int hashCode() {
        return typeName.hashCode();
    }

    public ResourceType(String typeName) {
        this.typeName = typeName;
//        properties = new HashSet<>();
    }

    public String getName() {
        return typeName;
    }

//    public Set<ResourceProperty> getProperties() {
//        return Collections.unmodifiableSet(properties);
//    }
//
//    public boolean addProperty(ResourceProperty resourceProperty) {
//        return properties.add(resourceProperty);
//    }
//
//    public boolean removeProperty(ResourceProperty resourceProperty) {
//        return properties.remove(resourceProperty);
//    }

    public Optional<ResourceProperty> getProperty(String propertyName) {
        return properties.stream()
                .filter(rp -> rp.getName().equalsIgnoreCase(propertyName))
                .findFirst();
    }

    public boolean isInstanceType() {
        return !properties.isEmpty();
    }


}
