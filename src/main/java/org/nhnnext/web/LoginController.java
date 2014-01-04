package org.nhnnext.web;

import javax.servlet.http.HttpSession;

import org.nhnnext.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {
	@Autowired
	UserRepository userRepository;

	@RequestMapping("/login")
	public String Login() {
		return "login";
	}

	@RequestMapping(value = "/logincheck", method = RequestMethod.POST)
	public String login(String username, String password, HttpSession session) {
		if (userRepository.exists(username)) {
			if (userRepository.findOne(username).getPassword().equals(password)) {
				session.setAttribute("username", username);
				return "redirect:/post/list";
			} else
				return "/";
		} else
			return "/";
	}
	
	@RequestMapping(value = "/logincheck.json", method = RequestMethod.POST)
	public @ResponseBody String loginMobile(String username, String password, HttpSession session) {
		String success = "{\"code\":200, \"result\":\"OK\"}";
		String fail = "{\"code\":404, \"result\":\"FAIL\"}";
		if (userRepository.exists(username)) {
			if (userRepository.findOne(username).getPassword().equals(password)) {
				session.setAttribute("username", username);
				return success;
			} else
				return fail;
		} else
			return fail;
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		//session.removeAttribute("username");
		//session.removeAttribute("password");
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping("/join")
	public String join() {
		return "/join";
	}

	@RequestMapping(value = "/join/joincheck", method = RequestMethod.POST)
	public String joincheck(String username, String password) {
		System.out.println(username + password);
		User newUser = new User(username, password);
		userRepository.save(newUser);
		return "redirect:/";
	}
}