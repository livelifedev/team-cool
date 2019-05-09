# LIBU

[![N|Solid](https://github.com/livelifedev/team-cool/blob/master/app/assets/images/logo.png?raw=true)](http://lib-u.herokuapp.com/)

## Description
LIBU is a web application which students and teachers have access to and be able to easily find academic materials, on a wide range of subjects, without infringing on copyright laws. 

View our application, [please click here](https://lib-u.herokuapp.com/)

## Purpose of LIBU application 
The aim is to provide a platform for students and teachers to upload, share and download academic materials created by their peers. This allows for materials to be covered under [Creative Commons](https://creativecommons.org/) licensing and can be distributed and shared freely.
View our repo [here](https://github.com/livelifedev/team-cool)

In addition, LIBU is to become a community where students can share and discuss ideas with their peers and/or educators. The interface should make it easier for our users to locate relevant information by being intuitive, easy to navigate and grouping materials by subject.
## Functionality / features

## Screenshots
[Libu's Homepage](https://drive.google.com/file/d/1ENonLfJmuXfCxyIz2jQHlhYNyG2DIKMk/view?usp=sharing)

## Tech stack (e.g. html, css, deployment platform, etc)
(i) Ruby on Rails
(ii) HTML
(iii) CSS
(iv) Stripe
(v) Devise
(vi) Cypress
(viii) Github
(ix) GitKraken
(x) Trello
(xi) Slack
(xii) Lucidchart


## Instructions on how to setup, configure and use your App.
TBC
## Design documentation
TBC
#### Design process
TBC
#### User stories
(i) As a student with minimal income, I want to be able to quickly access to a low cost and up-to-date research in European history as I’m completing my final year in Bachelor of Arts.
(ii) As a year 12 student, I’d love to access other students’ works in Mathematics on my phone so I could be better prepared for my HSC at the end of this year
(iii) As a teacher, I would like to share my research materials and books in a platform for academics
#### A workflow diagram of the user journey/s.
TBC
#### Wireframes
View our wireframe [here](https://drive.google.com/file/d/1VY1LZgJODxal_xDovEaXdbKk0HLO-Ys6/view?usp=sharing)
#### Database Entity Relationship Diagrams
View our Database Entity Relationship Diagram [here](https://drive.google.com/file/d/1Bgd5D19MojKDgLunFlrRvbdFc8GuPFx1/view?usp=sharing)
#### Details of planning process
TBC
#### Project plan & timeline
TBC
#### Screenshots of Trello board(s)
Project Development Management using [Trello](https://drive.google.com/file/d/1dGexnrkb0L7UOkHCOWa-NUExOr3xSQcF/view?usp=sharing)
## Short Answer questions (Section 2.2)

##### 1. What is the need (i.e. challenge) that you will be addressing in your project?
    
For students and teachers to have access to and be able to easily find academic materials, on a wide range of subjects, without infringing on copyright laws. 


##### 2. Identify the problem you’re trying to solve by building this particular marketplace App? Why is it a problem that needs solving?
Students have to learn a lot, a broad amount of topics across many different topics. It can be overwhelming and time-consuming filtering search results in search engines for concise and relevant information.

Sometimes it is also difficult to understand some of the material that you find online, some of it is just vague writing that briefly addresses multiple topics just to have a quick internet article. 
Both teachers and students have quality knowledge that can be useful to others, so having a central place where teachers and students can share and publish quality and relevant articles and materials is the challenge that we are addressing.

##### Describe the project will you be conducting and how. your App will address the needs.

We aim to develop a platform for students and teachers to upload, share and download academic materials created by their peers. This allows for materials to be covered under creative commons licensing and can be distributed and shared freely. 
It also aims to be a space where students can share and discuss ideas with their peers or educators. 
The interface should make it easier for the user to locate relevant information by being intuitive, easy to navigate and grouping materials together by subject. 


##### Describe the network infrastructure the App may be based on.


##### Identify and describe the software to be used in your App.


##### Identify the database to be used in your App and provide a justification for your choice.
PostgreSQL is used for this rails app, it is a free open source and community driven database management system that contain all the necessary features for managing general purpose object-relational databases, plus it is easy to install on the OS, it’s compatible and easy to setup with Rails and there is wide range of support and documentation online.

##### Identify and describe the production database setup (i.e. postgres instance).


##### Describe the architecture of your App.

##### Explain the different high-level components (abstractions) in your App.


##### Detail any third party services that your App will use.

Stripe for payment processing
Cypress for application testing
Devise for user registration

##### Describe (in general terms) the data structure of marketplace apps that are similar to your own (e.g. eBay, Airbnb). 
>>>>>(GEORGIE REMEMBER TO FIX UP)
	
Bored of Studies - http://www.boredofstudies.org/ 
Bored of studies is a platform for students within NSW and VIC to share their essays from year 11 and 12 HSC with other members of the site. 
Each resource has an associated; description, subject, title etc. and these can be used to search database.

##### Discuss the database relations to be implemented.
Most of the database relationships concern the one-to-many type of relationship, these include the users to listings, users to questions, users to bookmarks, users to comments, users to ratings. These are all one-to-many relationships, in that the user can have many of each of these elements, but the elements themselves can only belong to one user.
The same is true for questions to answers. We can have multiple answers for one questions, but those answers can only belong to the one question.
The other relationship that we have in our databases is the many-to-many relationship, this is for listings to subjects. A listing can have multiple subjects and a subject can belong to multiple listings.
Databases can also reference (establish a relationship) with more than one database, such as the ratings has the one-to-many relationship with both users and listings, because a user will create a rating on a listing so the rating will have both the user’s and listing’s id.

##### Describe your project’s models in terms of the relationships (active record associations) they have with each other.


##### Database schema design


##### User stories 
(i) As a student with minimal income, I want to be able to quickly access to a low cost and up-to-date research in European history as I'm completing my final year in Bachelor of Arts.
(ii) As a year 12 student, I'd love to access other students' works in Mathematics on my phone so I could be better prepared for my HSC at the end of this year
(iii) As a teacher, I would like to share my research materials and books in a platform for academics

##### Provide Wireframes for your App.
[Wireframing](https://drive.google.com/file/d/1VY1LZgJODxal_xDovEaXdbKk0HLO-Ys6/view?usp=sharing) 

##### How tasks are allocated and tracked in our project.

We split the project into front end and back end. 

We all had a shared [Trello board](https://drive.google.com/file/d/1zRKFKs49JYjieJaIxrs7cit-pkVIHi95/view?usp=sharing) which we posted tasks on.
 
We were always communicating via [Slack](https://drive.google.com/file/d/1SXJ2IFB9sQsaSef8Ryyna_Ddg2Dk7XTi/view?usp=sharing ) to keep each other updated about what was going on.


##### Discuss how Agile methodology is being implemented in your project.


##### Provide an overview and description of your Source control process.
In term of source control, we use Git for tracking changes in source code during our application development.
(i) Starting with the basics: one Repo owner and all members branch out from master to work on different tasks
(ii) Keep our source code in Github and using GitKraken to track our progress
(iii) Ensure the working file is from the latest version of the source file.
(iv) Commit often 
(v) Make clear notes in the “add comments” about why the changes were made before pushing them to GitHub

##### Provide an overview and description of your Testing process.
For testing, we use Cypress which is a Javascript-based end end-to-end testing framework. Cypress gives us the ability to take shortcuts and programmatically login feature before any tests run. That means we don’t have to visit a login page, type in an email and password, and run the test. 
We test number of features in our application: user’s registration, log in, update profile, creating documents and queries.

##### Discuss and analyse requirements related to information system security.
Information system security (ISS)  and protection of personal information need to be addressed and implemented right at the start of the development process. 
Ensure personal data stored on our server remain accessible and useful to only legitimate users.
Implement measures to protect the application against malicious attacks and prevent unauthorized access to database.
Put preventative measures to guard against unauthorized use 

##### Discuss methods you will use to protect information and data.

Users can only access their own profile using their own passwords 
Restricting users privileges
Minimal error messages
Using validation on both front-end and back-end
Ensure correct file extension are uploaded

##### Research what your legal obligations are in relation to handling user data.
In Australia, handling customer data and private information are regulated by the Australian Privacy Act (1988) which includes 13 Australian Privacy Principles (APPs). Its purpose is to promote transparency and accountability in information handling and require businesses to notify of any privacy and/or data breaches. 
Ensure LIBU manage personal information in an open and transparent way - providing our users to our Privacy policy 
LIBU can collect personal information that is requested and security measures are put in place to ensure the safety of personal sensitive information
Ensure users aware and understand when and in what circumstances that LIBU collect personal information
Advise users how we may use and disclose personal information that we holds
LIBU takes reasonable steps to protect personal information from misuse, interference and loss and from unauthorized access, modification or disclosure
LIBU has the obligation to provide when users request to access their own personal information and update them accordingly

