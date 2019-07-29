'''
    Function to use for the DB project.
    ---- Notes ----
    We probably will get dictionairies / json files from our input,
    and thus these functions will work accordingly.
'''

def validate_run(dict):
    '''
    '''
    dict_cpy = dict

    all_columns = ["duration", 
    "pace_per_mile", "elevation", 
    "distance", "circle_id", 
    "location_id", "smart_integration",
    "actual_date", "scheduled_date"]

    for word in all_columns:
        if word not in dict_cpy:
            dict_cpy[word] = None



def main():

    dict1 = {"duration": 1023.12, "pace_per_mile": 5, 
            "elevation": 7, "distance": 18, 
            "circle_id": 1, "location_id": 12}
    
    dict2 = {"duration": "kittycat", "pace_per_mile": 5, 
            "elevation": 7, "distance": 18, 
            "circle_id": 1, "location_id": 12,
            "actual_date": "10-12-23", "scheduled_date": "10-12-23"}
    
    print("Dictionary 1")
    validate_run(dict1)
    print("Dictionary 2")
    validate_run(dict2)
    
main()

