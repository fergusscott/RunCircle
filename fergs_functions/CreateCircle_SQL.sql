-- Procedure to Create a running circle

use run_circle;
drop procedure if exists createCircle;
delimiter //


create procedure createCircle
( 
in profile_handle_param varchar (255),
in name_param varchar(255),
in location_name_param varchar(255)

)
begin 

-- declare the variables we'll need in the proc. 
declare location_id_var int;
declare profile_id_var int;

# Error handling and rollback.
declare _error bool default 0; 
declare continue handler for sqlexception set _error = 1;

-- select the profile id into the right variable. we do this to 2 of the parameters so we can just 
-- take strings from the users and grab the appropriate ID's ourselves. 

select profile_id 
into profile_id_var
from profile
where profile_handle_param = handle;

-- select the location_id into the appropriate variable from the location table
select location_id 
into location_id_var
from location
where location_name_param = city_name;

     -- start the transaction
	start transaction; 
    
    -- insert the given values into the create circle table 
    insert into circle(profile_id, avg_duration, avg_speed, name, location_id, num_members)
		values(profile_id_var, 0, 0, name_param, location_id_var, 1);

	if(_error = 1) then 
		rollback;
	else
		commit;
	end if;
		
end //
    
    delimiter ;
