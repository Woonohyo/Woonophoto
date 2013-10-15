package org.nhnnext.web;

import java.io.UnsupportedEncodingException;
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
	public String create(Post post, MultipartFile photoFile)
			throws UnsupportedEncodingException {
		FileUploader.upload(photoFile);
		String encodedFileName = photoFile.getOriginalFilename();
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

	@RequestMapping(value = "/{id}/modify", method = RequestMethod.POST)
	public String modify(@PathVariable Long id, Post post, MultipartFile photoFile) {
		FileUploader.upload(photoFile);
		post.setFileName((photoFile.getOriginalFilename()));
		postRepository.delete(id);
		post.setId(id);
		Post modifiedPost = postRepository.save(post);
		return "redirect:/post/" + modifiedPost.getId();
	}

	@RequestMapping(value = "/{id}/delete", method = RequestMethod.POST)
	public String delete(@PathVariable Long id, Post post, MultipartFile photoFile) {
		postRepository.delete(id);
		return "redirect:/";
	}
}
