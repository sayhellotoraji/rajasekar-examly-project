package com.example.demo.model;
import java.util.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.NotEmpty;

import com.sun.istack.NotNull;

@Entity
public class Product {
	
	
	@Id
	private int product_code;
	
	private String product_name;
	
	private float product_price;
	
	private float product_gst;
	
	public int getProduct_code() {
		return product_code;
	}
	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public float getProduct_price() {
		return product_price;
	}
	public void setProduct_price(float product_price) {
		this.product_price = product_price;
	}
	public float getProduct_gst() {
		return product_gst;
	}
	public void setProduct_gst(float product_gst) {
		this.product_gst = product_gst;
	}
	@Override
	public String toString() {
		return "{product_code=" + product_code + ", product_name=" + product_name + ", product_price="
				+ product_price + ", product_gst=" + product_gst + "}";
	}
	
}
