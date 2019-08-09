use run_circle;

drop procedure if exists addFriend;
delimiter //

create procedure addFriend

(
in profile_profile_id_param int,
in profile_profile_id1_param int
)
begin

  # Error handling and rollback.
	 declare _error bool default 0; 
	 declare continue handler for sqlexception set _error = 1;
     
	 -- Make it a transaction 
     start transaction; 
     
     -- insert profile id's into the connections table
     insert into friend_connections(profile_profile_id, profile_profile_id1)
			values(profile_profile_id_param, profile_profile_id1_param);
	-- deal withthe possibility that it may be an error 
	if(_error = 1) then 
		rollback;
	else
		commit;
	end if;
    
    end //
    
    delimiter ;
    
    call addfriend(1,2);
    select * from friend_connections;
	
    

-- We want addFriend to add another profile for them to then be connected. 
-- So, when someone hits add friend, it should take that profile ID, and add it to the 
-- connections table, as well as their own profile ID, to denote a connection between the two of them. 

-- So we neeed to define where those profile ID's are going to come from.  
-- Transaction so will throw exception and rollback if there is any error. 

