USE run_circle;

DROP PROCEDURE IF EXISTS InsertRun;
DELIMITER //
CREATE PROCEDURE InsertRun
(
	in user_id_param INT,
	in profile_id_param INT,
	in duration_param float,
    in distance_in_miles_param float,
    in circle_id_param INT,
    in elevation_param INT,
    in location_id_param INT,
    in smart_integration_param INT,
    in scheduled_date_param DATETIME
)
BEGIN
    declare last_run_id int; 
    declare _rollback bool default 0;
    declare continue handler for SQLEXCEPTION set _rollback = 1;
	   
    # The actual insert is here.
    # Make it a transaction to make sure it all goes through.
    START TRANSACTION;
		INSERT INTO run (duration, pace_per_mile, elevation, distance, circle_id, 
		location_id, smart_integration, actual_date, scheduled_date) 
		VALUES (duration_param, pace_per_mile, elevation_param, 
			distance_in_miles_param, circle_id_param, location_id_param, 
			smart_integration_param, CURDATE(), scheduled_date_param);
            
		# This gets the last run id! The one we just put in, hopefully.
		SELECT LAST_INSERT_ID() INTO last_run_id;
		# Insert it into the run has user table.
		INSERT INTO run_has_profile VALUE (last_run_id, profile_id_param);
		IF _rollback THEN
	 		ROLLBACK;
	 	ELSE 
	 		COMMIT;
	 	END IF;
END //

DELIMITER ;

SELECT * FROM run;
SELECT * FROM run_has_profile;

