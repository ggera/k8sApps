package com.geralabs.monitoring;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Date;

@Controller
public class HelloController {

	@GetMapping("/app2")
	public String app2( Model model) {
		model.addAttribute("today", new Date().toString());
		return "app2";
	}

}
