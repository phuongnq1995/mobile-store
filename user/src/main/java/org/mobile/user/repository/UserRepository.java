package org.mobile.user.repository;

import org.mobile.user.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface UserRepository extends JpaRepository<User, String> {

	@Query("SELECT CASE  WHEN count(u)> 0 THEN true ELSE false END FROM User u WHERE u.email =:email AND u.password IS NOT NULL")
	boolean findUserPresent(@Param("email") String email);

}
