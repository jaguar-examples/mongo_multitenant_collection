# mongo_multitenant_collection

Example showcasing multitenant application where each user gets a collection.

# Server

## Route handlers

Directory `lib/server/api/api.dart` contains all the route handlers.

`TodoApi` implements route handlers to create, update and remove task items for the logged in user.

`AuthRoutes` implements route handlers to signup, login and logout the user.


