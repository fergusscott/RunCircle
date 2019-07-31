USE run_circle;

DROP PROCEDURE IF EXISTS InsertRun;
DELIMITER //
CREATE PROCEDURE InsertRun
(
	in user_id_param INT,
	in profile_id_param INT,
	in duration_param TIME,
    in distance_in_miles_param float,
    in pace_per_mile_param TIME,
    in circle_id_param INT,
    in elevation_param INT,
    in location_id_param INT,
    in smart_integration_param INT,
    in scheduled_date_param DATETIME
)
BEGIN

	-- InsertRun does 3 things
    -- 1. Inserts the run into the run table.
	-- 2. Connects the run to the profile of the runner.
    -- 3. Updates the profile with their new statistics.
    -- The whole thing is a transaction - so it rollsbacks in case of an error.

    DECLARE last_run_id INT;
    
    # For updating the profile
    DECLARE amt_runs_prev INT;
    DECLARE new_avg_dis FLOAT;
    
    # Error handling and rollback.
    DECLARE _error BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET _error = 1;
    
    # We make it a transaction. Right now it's a blanket error handler 
    # may be able to make it more precise later.
	#START TRANSACTION;
		INSERT INTO run (duration, pace_per_mile, elevation, distance, circle_id, 
			location_id, smart_integration, actual_date, scheduled_date) 
			VALUES (duration_param, pace_per_mile, elevation_param, 
				distance_in_miles_param, circle_id_param, location_id_param, 
				smart_integration_param, current_timestamp(), scheduled_date_param);
				
			# This gets the last run id! The one we just put in, hopefully.
			SELECT LAST_INSERT_ID() INTO last_run_id;
            
			# Insert it into the run has user table.
			INSERT INTO run_has_profile VALUE (last_run_id, profile_id_param);
            
            # Update the profile with new statz. With a z.
            # Get their current amount of runs.
            SELECT runs INTO amt_runs_prev FROM profile where profile_id = profile_id_param;
            
            # First run? Well, easy enough. Update the profile with all the statz of the run.
            IF amt_runs_prev = 0 THEN
				UPDATE profile SET runs = 1 WHERE profile_id = profile_id_param;
				UPDATE profile SET avg_duration = duration_param WHERE profile_id = profile_id_param;
				UPDATE profile SET pace_per_mile = pace_per_mile_param WHERE profile_id = profile_id_param;
				UPDATE profile SET avg_distance_miles = distance_in_miles_param WHERE profile_id = profile_id_param;
                
			# Oh, you've run before? We'll handle that.
            ELSE
				# Get the average. Calculate total distance ran. Add the new run, get the new average. Repeat for other statz.
				SELECT ((avg_distance_miles * amt_runs_prev) + distance_in_miles_param) / (amt_runs_prev + 1) INTO new_avg_dis 
					FROM profile WHERE profile_id = profile_id_param;
                
                UPDATE profile SET avg_distance_miles = distance_in_miles_param WHERE profile_id = profile_id_param;
				UPDATE profile SET pace_per_mile = new_avg_ppm WHERE profile_id = profile_id_param;
				UPDATE profile SET avg_duration = new_avg_dur WHERE profile_id = profile_id_param;
				UPDATE profile SET runs = amt_runs_prev + 1 WHERE profile_id = profile_id_param;
			END IF;
            
			#IF(_error = 1) THEN
			#	ROLLBACK;
			#ELSE
			#	COMMIT;
			#END IF;
END //

DELIMITER ;

CALL InsertRun(3, 3, '00:27:05', 3.05, '00:04:23', NULL, 3, 1, NULL, NULL);

select * from profile;
select * from run;
select * from run_has_profile;