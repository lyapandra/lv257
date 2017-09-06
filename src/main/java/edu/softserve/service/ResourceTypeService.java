package edu.softserve.service;

import edu.softserve.entity.ResourceProperty;
import edu.softserve.entity.ResourceType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
@Transactional
public class ResourceTypeService {

    private Map<String, ResourceType> types = new HashMap<>();

    private Map<String, ResourceType> stabTypes = new HashMap<>();

    public List<ResourceType> getTypesStab(){
        List<ResourceProperty> properties = new ArrayList<>();
        ResourceProperty property1 = new ResourceProperty();
        property1.setName("automobile name");
        ResourceProperty property2 = new ResourceProperty();
        property2.setName("engine capacity");
        ResourceProperty property3 = new ResourceProperty();
        property3.setName("baggage capacity");

        properties.add(property1);
        properties.add(property2);
        properties.add(property3);
        ResourceType resourceType = new ResourceType("lezkovi avto");
        resourceType.setProperties(properties);
        stabTypes.put("lezkovi avto" , resourceType);

        List<ResourceProperty> properties2 = new ArrayList<>();
        ResourceProperty property4 = new ResourceProperty();
        property4.setName("building type");
        ResourceProperty property5 = new ResourceProperty();
        property5.setName("building height");
        ResourceProperty property6 = new ResourceProperty();
        property6.setName("building width");

        properties2.add(property4);
        properties2.add(property5);
        properties2.add(property6);
        ResourceType resourceType2 = new ResourceType("building");
        resourceType2.setProperties(properties2);
        stabTypes.put("building" , resourceType2);

        System.out.println(stabTypes);

        return Arrays.asList(resourceType, resourceType2);
    }

    public List<ResourceProperty> getPropertiesStab(String resourseTypeName){
        System.out.println("getPropertiesStab() with: " + resourseTypeName);
        ResourceType resourceType = stabTypes.get(resourseTypeName);
        if (resourceType != null){
            List<ResourceProperty> properties = resourceType.getProperties();
            System.out.println(properties);
            return properties;
        }
        return null;
    }

    public Collection<ResourceType> getTypes() {
        return Collections.unmodifiableCollection(types.values());
    }

    public void add(ResourceType resourceType) {
        types.putIfAbsent(resourceType.getName(), resourceType);
    }

    public void remove(ResourceType resourceType) {
        types.remove(resourceType.getName());
    }

    public Optional<ResourceType> get(String typeName) {
        return Optional.ofNullable(types.get(typeName));
    }

    public void create(String typeName) {
        ResourceType type = types.get(typeName);
        if (type != null) {
            System.out.printf("Creating ResourceTable '%s':%n", type.getName());
            type.getProperties().forEach(rp -> System.out.printf("adding field '%s'%n", rp.getName()));
            System.out.println("done.");
        }
    }

}
