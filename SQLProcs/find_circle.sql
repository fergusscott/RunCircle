USE run_circle;
DROP PROCEDURE IF EXISTS findRunCircle;

# A function very similar to run_friend (read that first)
# We determine a suitable circle in your area. 
# It'll be based on average run duration and speed.

DELIMITER // 
CREATE PROCEDURE findRunCircle(
	in profile_id_param INT
)
BEGIN
    DECLARE profile_avg_duration TIME;
    DECLARE profile_preferred_location INT;
    
    # Fill up the variables!
    SELECT avg_duration INTO profile_avg_duration FROM profile WHERE profile_id = profile_id_param;
	SELECT preferred_location INTO profile_preferred_location FROM profile WHERE profile_id = profile_id_param;
    
    # The check for a good circle is a lot less strict. Theoretically, there'll
    # be way less circles than runners, so we want to make sure people get a match!
    SELECT 
        avg_duration, 
        location_id,
        circle_id,
        name
	FROM circle
    WHERE preferred_location = profile_preferred_location 
		and (ABS(avg_duration - profile_avg_duration) < (profile_avg_duration * 0.05))
        ;
    
END //