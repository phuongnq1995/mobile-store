package org.mobile.user.service;

import java.util.HashSet;
import java.util.List;

import org.mobile.user.model.Role;
import org.mobile.user.model.User;
import org.mobile.user.repository.RoleRepository;
import org.mobile.user.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private RoleRepository roleRepository;

	public String insert(User user) {
		userRepository.save(user);
		return "Save success !";
	}

	public void save(User user) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		HashSet<Role> roles = new HashSet<Role>();
		Role role = roleRepository.findOne(1);
		roles.add(role);
		user.setRoles(roles);
		userRepository.save(user);
	}

	public User findUser(String email) {
		return userRepository.findOne(email);
	}

	public boolean findUserPresent(String email) {
		System.out.println("KQ:"+userRepository.findUserPresent(email));
		return userRepository.findUserPresent(email);
	}

	public List<User> findAllMembers() {
		return userRepository.findAllMember();
	}

}
