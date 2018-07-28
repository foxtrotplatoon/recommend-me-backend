#### #### #  # #   # #### #   #
#    #  # # ## # # # ####  ###
#### #### #  # ## ## #  #   #

# README #

This back-end is using rails with active record and psql.
Important, additional gems includes Devise and Doorkeeper.

This read me will have some tips and guidelines for accessing our database.


# POST FOR USER CREATION #

You will be making a POST request with content-type 'application/JSON' to '/users'
The raw JSON of your body will be:
{ "User": {"first_name": 'xxx', "last_name": 'xxx', "birthdate": 'dd/mm/yyyy', "email": "x@x.com", "password": 'xxx'}}

Upon a successful POST request, a new user will be created in the psql db. In addition, you will get a JSON similar to this:
{"access_token":"dfe1ac93a4b6628bf32ed29e53c9f55b4cd50f4552d0b414be26e83f2e25c00b","token_type":"bearer","created_at":1532808866,"status_code":200,"message":"Signed in successfully.","result":{"id":3,"first_name":"testgirl","last_name":"testington","birthdate":"2000-01-01","email":"testgirl@test.com","created_at":"2018-07-28T19:53:40.693Z","updated_at":"2018-07-28T19:53:40.693Z"}}

All other user routes will follow similarly.

# GETTING AUTH TOKENS #

To make a POST request for a user, and receive an auth token, you will be making your POST to 'oauth/token' with content-type 'application/JSON'
The raw JSON of your body will be as follows, using our test user as an example:
{"email": "testboy@test.com", "password": "testtest", "grant_type": "password"}

You will receive in return a JSON similar to this:
{
resource_owner_id <~ this is the user.id
token <~ this is the token you are looking for
created_at
scopes
}

You will want to use the resource_owner_id to check the user.id, and you will use the auth token for validation.

# SCHEMA AND PSQL TABLES #

Coming soon....


