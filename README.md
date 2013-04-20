# A technical description of the VATEUD PTD application

*by __Svilen Vassilev__, VATEUD7, Web Services Director*

***... work in progress ...***


## Authentication
The backend access to the application, available for administrators PTD staff, instructors and examiners
is gated by an authentication system. New backend user records can only be created by existing app admins,
sign up is not possible, password reset tool is provided. Passwords are stored as a random-salted
SHA1 hash. No sensitive data is stored in plain text.

## Frontend

### Pilot records
Each pilot is limited to only check their own record and history, by using a unique, non-reversible URL.
This URL is initially emailed to the pilot with the welcome email after enrolling, and subsequently 
included in each notification email for the lifecycle of the training (see "Email Automation" section).

## Email automation

Emails are automatically being sent by the app in the following cases to the following recipients:

### Upon pilot registration/enrollment

* When a pilot has *enrolled* for training by filling the form at http://ptd.vateud.net __OR__
* When a pilot record has been manually *created* on the backend by an administrator:
* A welcome email is sent *to the pilot* with his record details and general training instructions
* A notification email is sent *to all admin users* of the app, advising that a new pilot
  has enrolled for training and listing the pilot's details

### Upon assigning an instructor to a pilot
* When a pilot record is edited to *assign/reassign an instructor* to a pilot:
* A notification email is sent *to the pilot*, advising him an instructor has been assigned for
  his training and providing the instructors details: name, VATSIM id, email
* A notification email is sent *to the instructor*, advising them they have been assigned
  a new pilot trainee and providing all the pilot details: name, id, email, requested rating,
  division, vacc, atc rating, etc.

### Upon issuing an exam token
* When a pilot's record is marked with the "Token issued" check-mark:
* A notification email is sent *to the pilot*, advising them they can now sit their theoretical
  test and giving them instructions on how to access and log into the test system (currently ATSimTest)

### Upon passing the theoretical exam

* When a pilot's record is edited to acknowledge the passing of a theoretical exam and his mark:
* A notification email is sent *to the pilot* informing him that he has passed and about his mark
* A notification email is sent *to the pilot's instructor* informing him that his trainee
  has passed the test and about his mark

### Upon scheduling an examination
* When a new examination record is created and/or when an examination date gets changed:
* A notification email is sent *to the examiner* assigned for the examination, providing
  the necessary details: date, time, arrival and departure airports and participating pilot(s)
* A notification email is sent *to all pilots* involved in the examination with all the
  aforementioned details
* A notification email is sent *to the instructor(s)* of all pilots involved in the examination
  with the aforementioned details

### Upon passing the practical exam
* When a pilot's record is edited to acknowledge the passing of a practical exam and his mark:
* A notification email is sent *to the pilot* informing him that he has passed and about his mark
* A notification email is sent *to the pilot's instructor* informing him that his trainee
  has passed the examination and about his mark  

### Upon submitting a practical examination feedback
* When a pilot's record is edited to add practical examination feedback by the pilot's examiner:
* A notification email is sent *to the pilot* informing him of the received feedback and its contents
* A notification email is sent *to the pilot's instructor* informing him that his trainee
  has received examination feedback and its contents

### Upon upgrading
* When a pilot's record is edited to mark him as an "upgraded"
* A notification email is sent *to the pilot* informing him of the rating upgrade

__Overall, over the life-cycle of a single pilot training 15 different emails are being sent by the
application to different recipients__


### Technical details regarding the emails
* All emails sent by the app are multipart consisting of html and txt parts to satisfy both
  email clients that use or don't use html

## Chronography automation  

The __dates and times__ for the following events, related to the pilot records, are captured
automatically without manual input and are available for reference and housekeeping:

* Pilot enrollment
* Instructor assigned
* Exam token issued
* Theoretical exam passed
* Practical exam passed
* Upgraded
* Last update of the pilot record (on any change)

### History Log

Each "write" action to the database (creation, update, deletion) for any type of record (pilots, instructors,
examiners, examinations) is __logged__ together with the user who made the change, the date and time
and the details of the change.

## Data liberation

All records and record types can be either completely or selectively __exported__ via the
backend interface by any PTD admin to any of the following formats: csv, xml, json.
**Note:** this is __not__ a public API.