package org.mobile.user.service;

import org.mobile.user.model.User;
import org.mobile.user.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserRepository userRepository;

	public String save(User user) {
		userRepository.save(user);
		return "Save success !";
	}
	
	
}
