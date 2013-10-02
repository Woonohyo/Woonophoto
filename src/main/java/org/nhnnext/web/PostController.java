package org.nhnnext.web;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.nhnnext.repository.PostRepository;
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

	@RequestMapping("/new")
	public String post() {
		return "post";
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public String create(Post post, MultipartFile photofile) throws UnsupportedEncodingException {
		FileUploader.upload(photofile);
		String encodedFileName = photofile.getOriginalFilename();
		post.setFileName(encodedFileName);
		Post savedPost = postRepository.save(post);
		return "redirect:/post/" + savedPost.getId();
	}

	@RequestMapping("/{id}")
	public String view(@PathVariable Long id, Model model) {
		Post savedPost = postRepository.findOne(id);
		model.addAttribute("post", savedPost);
		return "viewPost";
	}
}
