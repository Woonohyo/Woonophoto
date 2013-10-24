package org.nhnnext.web;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpSession;

import org.nhnnext.repository.CommentRepository;
import org.nhnnext.repository.PostRepository;
import org.nhnnext.repository.UserRepository;
import org.nhnnext.support.FileUploader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/post")
public class PostController {
	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private CommentRepository commentRepository;

	@RequestMapping("/new")
	public String post() {
		return "post";
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public String create(Post post, MultipartFile photoFile, HttpSession session)
			throws UnsupportedEncodingException {
		FileUploader.upload(photoFile);
		post.setFileName(photoFile.getOriginalFilename());
		String currentUser = (String)session.getAttribute("username");
		post.setUser(userRepository.findOne(currentUser));
		Post savedPost = postRepository.save(post);
		return "redirect:/post/" + savedPost.getId();
	}

	@RequestMapping("/{id}")
	public String view(@PathVariable Long id, Model model, Model modelComment) {
		Post savedPost = postRepository.findOne(id);
		modelComment.addAttribute("comments", savedPost.getComments());
		model.addAttribute("post", savedPost);
		return "viewPost";
	}

	@RequestMapping(value = "/{id}/modify", method = RequestMethod.POST)
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

	@RequestMapping(value = "/{id}/delete", method = RequestMethod.POST)
	public String delete(@PathVariable Long id, Post post, MultipartFile photoFile) {
		postRepository.delete(id);
		return "redirect:/";
	}
	
	@RequestMapping("/list")
	public String list(Model model, Model model2) {
		model.addAttribute("posts", postRepository.findAll());
		model2.addAttribute("comments", commentRepository.findAll());
		return "list";
	}
	
}
