# Rate my Teachers App

## About
* This CLI app is a survey intended for students as an opportunity to express how they feel and also for Teachers to receive unique feedback about their student. The teacher review will give the Teacher the idea of how their feelings affect the students performance and take the necessary steps to help them improve if ratings are low


## Project Functionalities
This app includes the following functionalities:

* NYC Pre-School API that parses NYC school names, location.
* The built-in database records are pulled from seed data using Faker methods.
* Domain includes four tables: Students, Teachers, School and Reviews having many to many relationships.
* Students are required to enter their name and which school they attend. Additionally, students will need to select their teacher, from a list of teachers, write a brief review description of their progress followed by selecting the emoji that best suit how they currently feel.

## The following methods were implemented in our CLI app:
  1. From the API communicator file, the  #Universal Pre-K (UPK) School Locations# API was used:
  2. API reader methods: **get_response_hash(url)** and **get_school_data will** that will parse JSON data.
  3. Student prompt as **getter methods** that will ask for input of student name, school, their teacher(s) selected from a list, a short review description, selecting an emoji that best suits their feelings and finally entering a rating between 1-5 regarding the teachers easiness, quality and helpfulness.
  4. Aggregate methods: **highest_rating**, **lowest_rating** and **average_rating** that outputs the highest, lowest and average rating of a specific teacher.
  5. **Get_feelings_score** method will be calculated by the average rating of the student.
  6. Pulling information from the Join Table 'Review' to create a review that includes the following, that the student entered:
      -Description
      -Rating
      -Quality
      -Easiness
      -Helpfulness
      -Feelings
      -Student_id
      -Teacher_id

## Installation Instructions
1. Clone this repository
2. run bundle
3. open the terminal
4. run ```ruby bin/run.rb```
