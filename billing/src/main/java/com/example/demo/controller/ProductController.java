package com.example.demo.controller;

import java.util.Optional;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.ProductRepo;
import com.example.demo.model.Product;
import com.google.gson.Gson;

@RestController
public class ProductController {
	
	
	@Autowired
	ProductRepo repo;
	
//	@RequestMapping("")
//	public String home()
//	{
//		return "productEntry";
//		
//	}
	
	
	
	@RequestMapping("/")
	public ModelAndView home1(){
		ModelAndView m=new ModelAndView();
		m.setViewName("index");
		return m;
	}
	@GetMapping("productEntry")
	public ModelAndView home(Product product) {
		ModelAndView m=new ModelAndView();
		
		System.out.println(product.getProduct_code());
		if(product.getProduct_code()!=0)
		repo.save(product);
		
		//repo.deleteById(0);
		
		Gson json1=new Gson();
		
		String response=json1.toJson(repo.findAll());
		
		//System.out.println(response);
		m.addObject("obj",response);
		m.setViewName("productEntry");
		
		return m;
		
	}
	
	
	@PostMapping("productEntry")
	public ModelAndView addProduct(Product product) {
		

		ModelAndView mv=new ModelAndView();
		
	
		repo.save(product);
		
		Gson json=new Gson();
		
		String response=json.toJson(repo.findAll());
	
		//System.out.println(response);
		mv.addObject("obj",response);
		mv.setViewName("productEntry");
		
		return mv;
		
	}
	
//	@RequestMapping("get")
//	public List<Product> add(Product product) {
//	
//		return repo.findAll();
//		
//	}
//	
//
//	public List<Product> display() {
//
//		return repo.findAll();
//		
//	}
	
	@GetMapping("billing")
	public ModelAndView searchProduct1(Product product) {
		

		
		ModelAndView e=new ModelAndView();
		
		
		
		Gson json3=new Gson();
		
		String response=json3.toJson(repo.findAll());
		
		//System.out.println(response);
		e.addObject("search",response);
		e.setViewName("billing");
		
		return e;
		
		
		
	}
	
	@PostMapping("billing")
	public ModelAndView searchProduct2(Product product) {
		

		ModelAndView s=new ModelAndView();
		
		Gson json4=new Gson();
		
		String response=json4.toJson(repo.findAll());
		
		//System.out.println(response);
		s.addObject("search",response);
		s.setViewName("billing");
		
		return s;
		
		
//		ModelAndView s=new ModelAndView();
//		System.out.println(search.toString());
		
//		Gson json2=new Gson();
//		String result="";
//		Optional<Product> search=repo.findById(product.getProduct_code());
//		if(search.isPresent()) {
//			result=json2.toJson(search);
//		}
//	System.out.println(result);
//			s.addObject("result",result);
//			s.setViewName("billing");
//
//		
//		return s;
		
		
	}
	
	
	

}
