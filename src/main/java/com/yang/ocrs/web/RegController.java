package com.yang.ocrs.web;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yang.ocrs.service.RegService;
import com.yang.ocrs.service.UserService;
@Controller
@RequestMapping(value="/reg")
public class RegController {
	@Autowired
	private RegService rs;

	public RegService getRs() {
		return rs;
	}

	public void setRs(RegService rs) {
		this.rs = rs;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public String createFrom(RegBean regBean){
		return "reg";
	}
	@RequestMapping(method=RequestMethod.POST)
	public String register(Model model,@Valid RegBean regBean,BindingResult result ) {
		if(result.hasErrors()) {
			return "reg";
		} else {
			String regRes=rs.regist(regBean);
			model.addAttribute("regRes", regRes);
			return "regRes";
		}
	}
	
	@RequestMapping(value="/checkUserName",method=RequestMethod.GET)
	public @ResponseBody CheckResult checkUserName(@RequestParam(value="userName") String userName){
		boolean status= rs.checkUserName(userName);
		if(status){
			return CheckResult.pass();
		} else{
			return CheckResult.notPass();
		}
	}
	
	@RequestMapping(value="/checkStuID",method=RequestMethod.GET)
	public @ResponseBody CheckResult checkStuID(@RequestParam(value="stuID") String stuID){
		boolean status= rs.checkStuID(stuID);
		if(status){
			return CheckResult.pass();
		} else{
			return CheckResult.notPass();
		}
	}
}
