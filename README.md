# CONWAY'S BACK-END README #

This back-end is using rails with active record and psql.
Important, additional gems includes Devise and Doorkeeper.

This read me will have some tips and guidelines for accessing our database.


# POST FOR USER CREATION #

You will be making a POST request with content-type 'application/JSON' to '/users'
The raw JSON of your body will be:<br>
{ "User": {"first_name": 'xxx',<br>
"last_name": 'xxx',<br>
"birthdate": 'dd/mm/yyyy',<br>
"email": "x@x.com",<br>
"password": 'xxx'}}<br>

Upon a successful POST request, a new user will be created in the psql db. In addition, you will get a JSON similar to this:<br>
{"access_token":"dfe1ac93a4b6628bf32ed29e53c9f55b4cd50f4552d0b414be26e83f2e25c00b",<br>
"token_type":"bearer",<br>
"created_at":1532808866,<br>
"status_code":200,<br>
"message":"Signed in successfully.",<br>
"result":{"id":3,"first_name":"testgirl","last_name":"testington","birthdate":"2000-01-01","email":"testgirl@test.com","created_at":"2018-07-28T19:53:40.693Z","updated_at":"2018-07-28T19:53:40.693Z"}}<br>

All other user routes will follow similarly.

# GETTING AUTH TOKENS #

To make a POST request for a user, and receive an auth token, you will be making your POST to 'oauth/token' with content-type 'application/JSON'
The raw JSON of your body will be as follows, using our test user as an example:<br>
{"email": "testboy@test.com", "password": "testtest", "grant_type": "password"}

You will receive in return a JSON similar to this:<br>
{<br>
resource_owner_id <~ this is the user.id<br>
token <~ this is the token you are looking for<br>
created_at<br>
scopes<br>
}<br>

You will want to use the resource_owner_id to check the user.id, and you will use the auth token for validation.

# SCHEMA AND PSQL TABLES #

Coming soon....


