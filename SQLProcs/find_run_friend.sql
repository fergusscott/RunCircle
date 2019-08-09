USE run_circle;
DROP PROCEDURE IF EXISTS findRunFriend;
# Beta version of the algorithm.
# What makes a good running partner?
# 1. They should live in my location. I can't drive to Texas everyday to run with someone
# 	just because they run at my pace.
# 2. They should probably run my desired distance - it's not desirable to run with someone
# 	who has a similar pace, if that pace is only over a 1/10 of the distances I want to run.
# 3. I also probably would like to avoid running with someone who has 100000 runs registered
# 	if I have zero, and vice versa.

# Let's use these parameters to determine a good running partner.

DELIMITER // 

CREATE PROCEDURE findRunFriend(
	in profile_id_param INT
)
BEGIN
    DECLARE profile_avg_dis FLOAT;
    DECLARE profile_ppm TIME;
    DECLARE profile_avg_duration TIME;
    DECLARE profile_runs INT;
    DECLARE profile_preferred_location INT;
    
    # Fill up the variables!
    SELECT avg_distance_miles INTO profile_avg_dis FROM profile WHERE profile_id = profile_id_param;
    SELECT pace_per_mile INTO profile_ppm FROM profile WHERE profile_id = profile_id_param;
    SELECT avg_duration INTO profile_avg_duration FROM profile WHERE profile_id = profile_id_param;
    SELECT runs INTO profile_runs FROM profile WHERE profile_id = profile_id_param;
	SELECT preferred_location INTO profile_preferred_location FROM profile WHERE profile_id = profile_id_param;
    
	SELECT 
		avg_distance_miles, 
        pace_per_mile, 
        avg_duration, 
        runs, 
        preferred_location, 
        handle 
	FROM profile
    WHERE preferred_location = profile_preferred_location 
		and (ABS(avg_distance_miles - profile_avg_dis) < (profile_avg_dis * 0.05)) 
        and (ABS(runs - profile_runs) <= 5) 
		and (profile_id != profile_id_param)
        ;
END //
DELIMITER ;
