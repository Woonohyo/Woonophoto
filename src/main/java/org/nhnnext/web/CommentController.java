package org.nhnnext.web;

import javax.servlet.http.HttpSession;

import org.nhnnext.repository.CommentRepository;
import org.nhnnext.repository.PostRepository;
import org.nhnnext.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommentController {
	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	private CommentRepository commentRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@RequestMapping(value="/post/list/{id}/newComment", method=RequestMethod.POST)
	public String create(@PathVariable Long id, String contents, Model model, HttpSession session) {
		Post post = postRepository.findOne(id);
		String currentUser = (String)session.getAttribute("username");
		Comment comment = new Comment(contents, post, userRepository.findOne(currentUser));
		commentRepository.save(comment);
		model.addAttribute("comments", commentRepository.findAll());
		return "redirect:/post/list";
	}
}
