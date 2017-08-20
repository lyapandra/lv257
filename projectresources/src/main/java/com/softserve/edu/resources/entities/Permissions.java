/*
 * 
 */
package com.softserve.edu.resources.entities;

public class Permissions {

	private int id;
	private int id_role;
	private int id_feature;
	private String allowed;

	public Permissions() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId_role() {
		return id_role;
	}

	public void setId_role(int id_role) {
		this.id_role = id_role;
	}

	public int getId_feature() {
		return id_feature;
	}

	public void setId_feature(int id_feature) {
		this.id_feature = id_feature;
	}

	public String getAllowed() {
		return allowed;
	}

	public void setAllowed(String allowed) {
		this.allowed = allowed;
	}
}