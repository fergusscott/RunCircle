USE run_circle;

DROP PROCEDURE IF EXISTS ClaimRun;
DROP PROCEDURE IF EXISTS InsertRun;
DROP TRIGGER IF EXISTS update_profile_stats;
DROP TRIGGER IF EXISTS update_circle_stats;

DELIMITER //

# A trigger to update any profile connected to a run
# with its new statistics!
CREATE TRIGGER update_profile_stats
	AFTER INSERT ON run_has_profile
    FOR EACH ROW
    BEGIN
    	DECLARE curr_profile INT;
        DECLARE curr_run INT;
    
		# Data to be retrieved from the added run.
		DECLARE duration_param TIME;
		DECLARE distance_in_miles_param float;
		DECLARE pace_per_mile_param TIME;
        
         # For updating the profile
		DECLARE amt_runs_prev INT;
		DECLARE new_avg_dis FLOAT;
    
		# For new avg duration
		DECLARE avg_dur_sec INT;
		DECLARE added_dur_sec INT;
		DECLARE new_avg_dur_sec INT;
		DECLARE new_avg_dur TIME;
    
		# For new avg pace per mile.
		DECLARE cur_ppm_sec INT;
		DECLARE old_sec_all_miles INT;
		DECLARE total_sec_all_miles INT;
		DECLARE new_ppm_sec INT;
		DECLARE new_avg_ppm TIME;
        
        # Get the data from the run and who ran it.
        SELECT NEW.profile_profile_id INTO curr_profile;
        SELECT NEW.run_run_id INTO curr_run;
        
        # Find that persons amount of runs.
        SELECT runs INTO amt_runs_prev FROM profile where profile_id = curr_profile;
        
        # Populate the running params with the right data.
        SELECT duration into duration_param from run where run_id = curr_run;
        SELECT distance into distance_in_miles_param from run where run_id = curr_run;
        SELECT pace_per_mile into pace_per_mile_param from run where run_id = curr_run;
            
		# First run? Well, easy enough. Update the profile with all the statz of the run.
		IF amt_runs_prev = 0 THEN
			UPDATE profile SET runs = 1 WHERE profile_id = curr_profile;
			UPDATE profile SET avg_duration = duration_param WHERE profile_id = curr_profile;
			UPDATE profile SET pace_per_mile = pace_per_mile_param WHERE profile_id = curr_profile;
			UPDATE profile SET avg_distance_miles = distance_in_miles_param WHERE profile_id = curr_profile;
                
		# Oh, you've run before? We'll handle that.
		ELSE
			# Get the average. Calculate total distance ran. Add the new run, get the new average. Repeat for other statz.
			SELECT ((avg_distance_miles * amt_runs_prev) + distance_in_miles_param) / (amt_runs_prev + 1) INTO new_avg_dis 
				FROM profile WHERE profile_id = curr_profile;
                
			# Works!
			SELECT time_to_sec(avg_duration) INTO avg_dur_sec FROM profile WHERE profile_id = curr_profile;
			SELECT time_to_sec(duration_param) INTO added_dur_sec;
			SELECT ((avg_dur_sec * amt_runs_prev) + added_dur_sec) / (amt_runs_prev + 1) INTO new_avg_dur_sec;
			SELECT sec_to_time(new_avg_dur_sec) INTO new_avg_dur;
                
                # Works!
                SELECT time_to_sec(pace_per_mile) INTO cur_ppm_sec FROM profile WHERE profile_id = curr_profile;
                SELECT cur_ppm_sec * (avg_distance_miles * amt_runs_prev) INTO old_sec_all_miles FROM profile 
						WHERE profile_id = curr_profile;
                SELECT old_sec_all_miles + (time_to_sec(pace_per_mile_param) * distance_in_miles_param) INTO total_sec_all_miles
						FROM profile WHERE profile_id = curr_profile;
                SELECT total_sec_all_miles / ((avg_distance_miles * amt_runs_prev) + distance_in_miles_param) INTO
					new_ppm_sec FROM profile WHERE profile_id = curr_profile;
                SELECT sec_to_time(new_ppm_sec) INTO new_avg_ppm;
                
                UPDATE profile SET avg_distance_miles = new_avg_dis WHERE profile_id = curr_profile;
				UPDATE profile SET pace_per_mile = new_avg_ppm WHERE profile_id = curr_profile;
				UPDATE profile SET avg_duration = new_avg_dur WHERE profile_id = curr_profile;
				UPDATE profile SET runs = (amt_runs_prev + 1) WHERE profile_id = curr_profile;
			END IF;
    END //


# A trigger to update any circle with new stats, if a circle was
# entered in a run.
CREATE TRIGGER update_circle_stats
	AFTER INSERT ON run
	FOR EACH ROW
    BEGIN
		# Declare some variables.
		DECLARE last_run_id INT;
        DECLARE curr_circle_id INT;
        
        # These variables are needed if we need to update things.
        # First, durations stuff.
        DECLARE num_runs_circle INT;
        DECLARE dur_sec INT;
        DECLARE new_dur_sec INT;
        DECLARE new_avg_duration TIME;
        
        # Now, the speed.
        DECLARE total_ppm FLOAT;
        DECLARE new_ppm FLOAT;
        
        # This will be the run to check out.
        SELECT LAST_INSERT_ID() into last_run_id from run; 

		# If the circle_id is null, we can ignore the updates. But if not...
        IF circle_id IN (
			SELECT circle_id from run where run_id = last_run_id) 
				IS NOT NULL THEN
			
            # Get the circle's id, and how many times it has been associated with runs before.
            # This should be the NEW value of runs.
            SELECT circle_id into curr_circle_id from run where run_id = last_run_id;
            SELECT count(*) into num_runs_circle from run where circle_id = curr_circle_id;
        
			# We'll update the average duration and speed. We'll define speed as 
            # average ppm for the runs.
            SELECT time_to_sec(avg_duration) into dur_sec from circle where circle_id = curr_circle_id;
            SELECT (dur_sec * (nums_runs_circle - 1)) + (time_to_sec(duration)) into new_dur_sec
				from run where run_id = last_run_id;
            SELECT sec_to_time((new_dur_sec / nums_runs_circle)) into new_avg_duration;
            
            # Time done! Let's get the ppm. This is not the PPM, but rather, the avg 
            # ppm in each run the circle has completed.
            SELECT SUM(pace_per_mile) into total_ppm from run WHERE circle_id = curr_circle_id;
            SELECT ((total_ppm + pace_per_mile) / nums_runs_circle) 
				into new_ppm from run where run_id = last_run_id;
			
            UPDATE circle SET avg_duration = new_avg_duration WHERE circle_id = curr_circle_id;
            UPDATE circle SET speed = new_ppm WHERE circle_id = curr_circle_id;
            
		END IF;
            
    END //
    
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
    
    # Error handling and rollback.
    DECLARE _error BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET _error = 1;
    
    # We make it a transaction. Right now it's a blanket error handler 
    # may be able to make it more precise later.
	START TRANSACTION;
		INSERT INTO run (duration, pace_per_mile, elevation, distance, circle_id, 
			location_id, smart_integration, actual_date, scheduled_date) 
			VALUES (duration_param, pace_per_mile_param, elevation_param, 
				distance_in_miles_param, circle_id_param, location_id_param, 
				smart_integration_param, current_timestamp(), scheduled_date_param);
				
			# This gets the last run id! The one we just put in, hopefully.
			SELECT LAST_INSERT_ID() INTO last_run_id;
            
			# Insert it into the run has user table.
			INSERT INTO run_has_profile VALUE (last_run_id, profile_id_param);
            
			IF(_error = 1) THEN
				ROLLBACK;
			ELSE
				COMMIT;
			END IF;
END //

CREATE PROCEDURE claimRun(
	in profile_id INT,
    in run_id INT
) 
BEGIN
	DECLARE _error BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
		SET _error = 1;
		SELECT "Error with these parametes: " as ErrorMsg, profile_id, run_id;
    END; 
    
	START TRANSACTION;
		# The table should have uniqueness restraint on (run_id, profile_id) so no need
        # to check for anything.
        INSERT INTO run_has_profile(run_run_id, profile_profile_id) VALUES(run_id, profile_id);
        IF _error = 1 THEN
            SELECT
            ROLLBACK;
		ELSE 
			COMMIT;
		END IF;
END //  
DELIMITER ;