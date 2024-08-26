# Course and Tutor Management API

## Overview

This Rails application provides a RESTful API for managing courses and tutors. Each course can have multiple tutors, while each tutor is associated with only one course. The application includes endpoints for creating, updating, and listing courses and tutors, and ensures that no duplicate tutors are created.

## API Endpoints

### Courses

#### Create a Course with Tutors

- **Endpoint**: `POST /courses`
- **Description**: Creates a new course along with its associated tutors.
- **Parameters**:
  ```json
  {
    "course": {
      "name": "Course Name",
      "description": "Course Description",
      "tutors": [
        {
          "name": "Tutor Name",
          "email": "tutor@example.com"
        }
      ]
    }
  }
  ```
- **Responses**:
  - **201 Created**: Course and tutors successfully created.
  - **422 Unprocessable Entity**: Validation errors, including duplicate tutors.

#### Update a Course

- **Endpoint**: `PATCH /courses/:id`
- **Description**: Updates an existing course and its associated tutors.
- **Parameters**:
  ```json
  {
    "course": {
      "name": "Updated Course Name",
      "tutors": [
        {
          "name": "Updated Tutor Name",
          "email": "updated_tutor@example.com"
        }
      ]
    }
  }
  ```
- **Responses**:
  - **200 OK**: Course and tutors successfully updated.
  - **422 Unprocessable Entity**: Validation errors.

#### List All Courses with Tutors

- **Endpoint**: `GET /courses`
- **Description**: Retrieves a list of all courses along with their associated tutors.
- **Responses**:
  - **200 OK**: List of courses with tutors.

- **Responses**:
  - **201 Created**: Tutor successfully created.
  - **422 Unprocessable Entity**: Validation errors, including duplicate email within the same course.

### Gems Used

- **Rails**: Web application framework.
- **RSpec**: Testing framework for Ruby.
- **FactoryBot**: Fixtures replacement for Rails testing.
- **Representable**: Serialization library for representing JSON and XML data.
- **Faker**: Generates fake data for testing.

## Test Cases Covered

- **Model Validations**:
  - Presence of attributes (name, description, email, etc.).
  - Uniqueness of attributes (e.g., unique name for courses).
  - Validation of associated records (e.g., no duplicate tutors).
  
- **Associations**:
  - Courses can have many tutors.
  - Tutors belong to a single course.
  - Tutors are deleted when a course is deleted.

- **API Endpoints**:
  - **POST /courses**: Creates a new course and associated tutors.
  - **PATCH /courses/:id**: Updates course details and associated tutors.
  - **GET /courses**: Lists all courses with their tutors.
  
- **Error Handling**:
  - Handles validation errors for course and tutor creation.
  - Ensures proper error responses for invalid requests.

## Running the Tests

To run the test suite, use the following command:

```bash
bundle exec rspec
```
