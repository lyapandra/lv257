package com.softserve.edu.Resources.entity;

import com.softserve.edu.Resources.Constants;

import com.fasterxml.jackson.annotation.*;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "RESOURCE_CATEGORIES")
@JsonInclude(JsonInclude.Include.NON_EMPTY)
//@JsonIdentityInfo(generator = ObjectIdGenerat4ors.PropertyGenerator.class, property = "id")
public class ResourceCategory {
    @Id
    @GeneratedValue(generator = Constants.ID_GENERATOR)

    @Column(name = "Id")
    private Long id;

    @Column(name = "Category_Name"/*, unique = true*/)
    @JsonProperty("catname")
    private String categoryName;

    @ManyToOne
    @JsonBackReference
//    @JsonProperty("parent_id")
//    @JsonIdentityReference(alwaysAsId = true)
    @JoinColumn(name = "Id_Parent")
    private ResourceCategory parentCategory;

    @OneToMany(mappedBy = "parentCategory", cascade = CascadeType.ALL)
    @JsonManagedReference
    @JsonProperty("children")
    private Set<ResourceCategory> childrenCategories = new HashSet<>();

    @Column(name = "Hierarchy_Level")
//    @JsonProperty("level")
    @JsonIgnore
    private Integer hierarchyLevel;

    @Column(name = "Path_To_Root")
//    @JsonProperty("rootpath")
    @JsonIgnore
    private String pathToRoot;

    @OneToMany(mappedBy = "category")
    @JsonManagedReference
    @JsonProperty("restypes")
    private Set<ResourceType> resourceTypes = new HashSet<>();

    public ResourceCategory(String categoryName) {
        this.categoryName = categoryName;
    }

    public ResourceCategory() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public ResourceCategory getParentCategory() {
        return parentCategory;
    }

    public void setParentCategory(ResourceCategory parentCategory) {
        this.parentCategory = parentCategory;
    }

    public Set<ResourceCategory> getChildrenCategories() {
        return childrenCategories;
    }

    public void setChildrenCategories(
            Set<ResourceCategory> childrenCategories) {
        this.childrenCategories = childrenCategories;
    }

    public Integer getHierarchyLevel() {
        return hierarchyLevel;
    }

    public void setHierarchyLevel(Integer hierarchyLevel) {
        this.hierarchyLevel = hierarchyLevel;
    }

    public String getPathToRoot() {
        return pathToRoot;
    }

    public void setPathToRoot(String pathToRoot) {
        this.pathToRoot = pathToRoot;
    }

    public Set<ResourceType> getResourceTypes() {
        return resourceTypes;
    }

    public void setResourceTypes(Set<ResourceType> resourceTypes) {
        this.resourceTypes = resourceTypes;
    }

    @Override
    public String toString() {
        final StringBuilder builder = new StringBuilder();
        builder.append("Resource Category [name=").append(categoryName).append("]").append("[id=").append(id).append("]");
        return builder.toString();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ResourceCategory that = (ResourceCategory) o;

        return categoryName.equals(that.categoryName);
    }

    @Override
    public int hashCode() {
        return categoryName.hashCode();
    }

    public ResourceCategory(String categoryName, ResourceCategory parentCategory, Set<ResourceType> resourceTypes) {
        this.categoryName = categoryName;
        this.parentCategory = parentCategory;
        this.resourceTypes = resourceTypes;
    }
}
