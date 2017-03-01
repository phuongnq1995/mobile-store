package org.mobile.controller.publisher;

import javax.validation.Valid;
import org.mobile.publisher.model.Publisher;
import org.mobile.publisher.service.PublisherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@SessionAttributes("publisher")
public class PublisherController {

	@Autowired
	PublisherService publisherService;

	@RequestMapping(value = "/publishers", method = RequestMethod.GET)
	String showListPublisher(Model model) {
		model.addAttribute("publishers", publisherService.findAll());
		return "publishers";
	}

	@RequestMapping(value = "/publisher/new", method = RequestMethod.GET)
	String newPublisher(Model model) {
		model.addAttribute("publisher", new Publisher());
		return "savepublisher";
	}

	@RequestMapping(value = "/publisher/save", method = RequestMethod.POST)
	String savePublisher(RedirectAttributes redirectAttributes, @Valid Publisher publisher, BindingResult bindingResult)
			throws Exception {
		if(publisherService.findByName(publisher.getName()) != null)
			bindingResult.reject("name", "Duplicate.name");
		if (bindingResult.hasErrors()) 
			return "savepublisher";
		else 
			redirectAttributes.addFlashAttribute("SUCCESS_MESSAGE", publisherService.save(publisher));
		return "redirect:/publishers";
	}

	@RequestMapping(value = "/publisher/{id}", method = RequestMethod.GET)
	String editPublisher(Model model, @PathVariable int id) {
		model.addAttribute("publisher", publisherService.findOne(id));
		return "savepublisher";
	}

	@RequestMapping(value = "/publisher/delete/{id}", method = RequestMethod.GET)
	String deletePublisher(@PathVariable int id, RedirectAttributes redirectAttributes) {
		if (publisherService.findOne(id).getProducts().isEmpty())
			redirectAttributes.addFlashAttribute("SUCCESS_MESSAGE", publisherService.delete(id));
		else
			redirectAttributes.addFlashAttribute("ERROR_MESSAGE", "You need delete all products of this publisher !");
		return "redirect:/publishers";
	}
}
