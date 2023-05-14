## Assessment Description

You have been tasked with creating a simple web API using Shelf and Dart. Your API should have the following features:

### Multiple routes:

Your API should have three unique URL endpoints, each handling a different HTTP method (GET, POST, DELETE, etc.). The routes should be organized based on user type. The required routes for each user type are as follows:

#### Student:

- Login (POST): Allow students to log in with their username and password.
- Sign up (POST): Allow new students to create an account by submitting their name, email, username, and password.
- Send post (POST): Allow students to create a new post by submitting a title and content.

#### Teacher:

- Login (POST): Allow teachers to log in with their username and password.
- Sign up (POST): Allow new teachers to create an account by submitting their name, email, username, and password.
- Send post (POST): Allow teachers to create a new post by submitting a title and content.

#### Boss:

- Login (POST): Allow bosses to log in with their username and password.
- Sign up (POST): Allow new bosses to create an account by submitting their name, email, username, and password.
- Send post (POST): Allow bosses to create a new post by submitting a title and content.

### Middleware:

You should use middlewares to perform common tasks such as logging and any other middleware. You should apply middlewares to at least one of your routes.

### Error handling:

You should handle errors gracefully and return appropriate error responses to clients. You should also log errors and debug your code effectively.

## Evaluation Criteria

Your project will be evaluated based on the following criteria:

- Functionality: Does your API meet the requirements outlined in the assessment description?
- Code Quality: Is your code clean, well-organized, and easy to understand? Do you follow best practices for Dart and Shelf?
- Error Handling: Do you handle errors gracefully and return appropriate error responses to clients? Do you log errors and debug your code effectively?

## Additional Notes

1. You can use any additional packages or libraries that you think are necessary to complete the assessment.
3. Your API should be able to handle requests and responses in JSON format.
4. You should use hot reload to speed up your development process and improve your productivity.
5. You should use Dart Code Metrics to analyze your code and improve its quality.

## Deadline
14/5/2023 10:00 AM
