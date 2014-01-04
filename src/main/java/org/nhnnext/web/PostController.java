package org.nhnnext.web;

import java.io.UnsupportedEncodingException;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.nhnnext.repository.CommentRepository;
import org.nhnnext.repository.PostRepository;
import org.nhnnext.repository.UserRepository;
import org.nhnnext.support.FileUploader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class PostController {
	
	private static final Logger log = LoggerFactory.getLogger(PostController.class);
	
	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private CommentRepository commentRepository;

	@RequestMapping("/post/new")
	public String post() {
		return "post";
	}

	@RequestMapping(value = "/post", method = RequestMethod.POST)
	public String create(Post post, MultipartFile photoFile, HttpSession session)
			throws UnsupportedEncodingException {
		FileUploader.upload(photoFile);
		post.setFileName(photoFile.getOriginalFilename());
		String currentUser = (String)session.getAttribute("username");
		post.setUser(userRepository.findOne(currentUser));
		Post savedPost = postRepository.save(post);
		return "redirect:/post/list";
	}
	
	@RequestMapping(value = "/new.json", method = RequestMethod.POST)
	public @ResponseBody Post createViaJson(Post post, MultipartFile photoFile, HttpSession session)
			throws UnsupportedEncodingException {
		FileUploader.upload(photoFile);
		post.setFileName(photoFile.getOriginalFilename());
		String currentUser = (String)session.getAttribute("username");
		post.setUser(userRepository.findOne(currentUser));
		return postRepository.save(post);
	}

	@RequestMapping("/post/{id}")
	public String view(@PathVariable Long id, Model model, Model modelComment) {
		Post savedPost = postRepository.findOne(id);
		modelComment.addAttribute("comments", savedPost.getComments());
		model.addAttribute("post", savedPost);
		return "viewPost";
	}

	@RequestMapping(value = "/post/{id}/modify", method = RequestMethod.POST)
	public String modify(@PathVariable Long id, Post post, MultipartFile photoFile) {
		FileUploader.upload(photoFile);
		post.setFileName((photoFile.getOriginalFilename()));
		Post oldPost = postRepository.findOne(id);
		oldPost.setTitle(post.getTitle());
		oldPost.setContents(post.getContents());
		oldPost.setFileName(photoFile.getOriginalFilename());
		postRepository.save(oldPost);
		return "redirect:/post/" + oldPost.getId();
	}
	
	@RequestMapping(value = "/post/{id}/delete", method = RequestMethod.POST)
	public String delete(@PathVariable Long id, Post post, MultipartFile photoFile) {
		postRepository.delete(id);
		return "redirect:/post/list";
	}
	
	@RequestMapping("/post/list")
	public String list(Model model, Model model2) {
		Iterable ir = postRepository.findAll();
		Collections.reverse((List)ir);
		model.addAttribute("posts", ir);
		model2.addAttribute("comments", commentRepository.findAll());
		return "list";
	}
}
