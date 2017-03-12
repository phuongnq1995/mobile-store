package org.mobile.user.service;

import org.mobile.user.model.User;

public interface UserService {

	String insert(User user);
	
	User findUser(String name);
	
	void save(User user);

	boolean findUserPresent(String email);
	
}
