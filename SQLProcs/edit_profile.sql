USE run_circle;

DROP PROCEDURE IF EXISTS EditProfile;
DELIMITER //
CREATE PROCEDURE EditProfile
(
    in password_param varchar(50),
    in city_param varchar(50),
    in hidden_info_param tinyint(1),
    in hidden_profile_param tinyint(1),
    in old_handle_param varchar(50),
    in new_handle_param varchar(50)
)
BEGIN

    declare city_id int;
    declare han_prof_id int;
    declare user_prof_id int;
    
	# Error handling and rollback.
    DECLARE _error BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET _error = 1;
    
    
	START TRANSACTION;
    
		select user_id into user_prof_id
        from profile
        where handle like old_handle_param;
    
		select profile_id into han_prof_id
        from profile
        where handle like old_handle_param;
    
		IF city_param IS NOT NULL THEN
			select location_id into city_id
			from location
			where city_name like city_param;
            
			UPDATE profile SET preferred_location = city_id WHERE profile_id = han_prof_id;
		END IF;
        
        IF password_param IS NOT NULL THEN
            UPDATE account SET password = password_param WHERE profile_id = han_prof_id;
		END IF;
        
        IF new_handle_param IS NOT NULL THEN 
			UPDATE profile SET handle = new_handle_param WHERE profile_id = han_prof_id;
		END IF;
        
		UPDATE profile SET hidden = hidden_profile_param WHERE profile_id = han_prof_id;
		UPDATE user SET hidden = hidden_profile_param WHERE user_id = user_prof_id;
	
    IF(_error = 1) THEN
		ROLLBACK;
	ELSE
		COMMIT;
	END IF;
END //

DELIMITER ;


 select * from account;
 select * from user;
 select * from profile;