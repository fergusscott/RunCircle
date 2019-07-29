USE run_circle;

DROP PROCEDURE IF EXISTS CreateAccount;
DELIMITER //
CREATE PROCEDURE CreateAccount
(
	in first_name_param varchar(50),
	in last_name_param varchar(50),
    in email_param varchar(255),
    in password_param varchar(50),
	in phone_param varchar(50),
    in dob_param DATE,
	in gender_param char(1),
    in location_param varchar(50),
    in hidden_info_param tinyint(1),
    in hidden_profile_param tinyint(1),
    in handle_param varchar(50)
)
BEGIN

	declare last_user_id int;
    declare last_profile_id int;
    
	START TRANSACTION;
		# Insert into user
		INSERT INTO user (dob, gender, first_name, last_name, 
		phone, hidden) 
		VALUES (dob_param, gender_param, 
			first_name_param, last_name_param, phone_param, 
			hidden_info_param);
		
		# Get last user id
		SELECT LAST_INSERT_ID() INTO last_user_id;
		
		# Insert into profile
		INSERT INTO profile (preferred_location, avg_distance_miles, pace_per_mile, avg_duration, runs, handle, hidden, user_id)
		VALUES (location_param, 0, 0, 0, 0, handle_param, hidden_profile_param, last_user_id);
		
		# Get last user id
		SELECT LAST_INSERT_ID() INTO last_profile_id;
		
		# Insert into account
		INSERT INTO account (email, password, phone, profile_id, user_id)
		VALUES (email_param, password_param, phone_param, last_profile_id, last_user_id);
    COMMIT;
END //

DELIMITER ;

 select * from account;
 select * from user;
 select * from profile;

