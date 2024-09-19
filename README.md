# Student Assessment Portal

## Overview

The Student Assessment Portal is a web application designed to manage assessments for students. It allows administrators to create and manage question sets, and students can take assessments based on these sets.

## Features

- **User Authentication and Authorization**: Secure login and role-based access control.
- **User Profiles**: Detailed user profiles including personal and contact information.
- **Question Management**: Creation, editing, and deletion of questions organized into sets.
- **Assessment Taking**: Students can access and complete assessments based on predefined question sets.
- **Results**: Student can fetch their results if any.
- **Data Validation**: Ensures data integrity and security through validation rules.

## Database Schema

### Users Table

```sql
CREATE TABLE users (
    name VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
    email VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL PRIMARY KEY,
    dob DATE NOT NULL,
    password VARCHAR(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
    usertype INT NOT NULL DEFAULT 0,
    -- Password constraints
    CONSTRAINT check_password_length CHECK (CHAR_LENGTH(password) BETWEEN 8 AND 12),
    CONSTRAINT check_password_uppercase CHECK (password REGEXP '.*[A-Z].*'),
    CONSTRAINT check_password_lowercase CHECK (password REGEXP '.*[a-z].*'),
    CONSTRAINT check_password_digit CHECK (password REGEXP '.*[0-9].*'),
    CONSTRAINT check_password_special CHECK (password REGEXP '.*[!@#$%^&(),.?":{}|<>].*')
);
```

### Users Table Error handlings

```sql

DELIMITER $$

CREATE TRIGGER before_insert_users
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
    IF NEW.dob > CURDATE() - INTERVAL 16 YEAR THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Date of birth indicates user is younger than 16 years';
    END IF;
END$$

DELIMITER ;
```

### User_Details Table

```sql
CREATE TABLE user_details (
    Email VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    FullName VARCHAR(255) NOT NULL,
    About TEXT,
    Country VARCHAR(255),
    Address VARCHAR(255),
    Phone CHAR(10) CHECK (Phone REGEXP '^[0-9]{10}$'),
    GitHubProfile VARCHAR(255),
    InstagramProfile VARCHAR(255),
    LinkedInProfile VARCHAR(255),
    College VARCHAR(255),
    FOREIGN KEY (Email) REFERENCES users(email),
    PRIMARY KEY (Email)
);
```

### Question Table

```sql
CREATE TABLE question (
    id INT NOT NULL AUTO_INCREMENT,
    question TEXT NOT NULL,
    a VARCHAR(255) NOT NULL,
    b VARCHAR(255) NOT NULL,
    c VARCHAR(255) NOT NULL,
    d VARCHAR(255) NOT NULL,
    answer CHAR(1) NOT NULL,
    set_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (set_id) REFERENCES question_set(id)
);

```

### Question_Set Table

```sql
CREATE TABLE question_set (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    question_count INT DEFAULT 0
);
```
### Subject_tag Table

```sql
CREATE TABLE subject_tag (
       id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(255) NOT NULL
     );
```

### Subjecttag_setid Table

```sql
 CREATE TABLE subjecttag_setid (
        set_id INT,
        subject_tag_id INT,
        PRIMARY KEY (set_id, subject_tag_id),
        FOREIGN KEY (set_id) REFERENCES question_set(id),
        FOREIGN KEY (subject_tag_id) REFERENCES subject_tag(id)
    );
```

### User_subject_tag Table

```sql
CREATE TABLE user_subject_tag (
    user_email VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    tag_id INT NOT NULL,
    PRIMARY KEY (user_email, tag_id),
    FOREIGN KEY (user_email) REFERENCES users(email),
    FOREIGN KEY (tag_id) REFERENCES subject_tag(id)
);
```

### Exams Table
```sql
CREATE TABLE exams (
    EID INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    QSID INT NOT NULL,
    start_time TIMESTAMP NOT NULL,
    finish_time TIMESTAMP NOT NULL,
    score INT DEFAULT 0 NOT NULL,
    FOREIGN KEY (email) REFERENCES users(email),
    FOREIGN KEY (QSID) REFERENCES question_set(id)
);
```

### Responses Table
```sql
CREATE TABLE responses (
    EID INT NOT NULL,
    QID INT NOT NULL,
    user_response CHAR(1) DEFAULT 'x' NOT NULL,
    is_match BOOLEAN NOT NULL,
    marks INT NOT NULL,
    PRIMARY KEY (EID, QID),
    FOREIGN KEY (EID) REFERENCES exams(EID),
    FOREIGN KEY (QID) REFERENCES question(id)
);
```

### Recent_updates Table

```sql
CREATE TABLE recent_updates (
          id INT AUTO_INCREMENT PRIMARY KEY,
          message VARCHAR(255),
          date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      );
```
### User_results Table

```sql
CREATE TABLE user_results (
    eid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    qsid INT NOT NULL,
    email VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    set_name VARCHAR(255),
    total_score INT,
    user_score INT,
    FOREIGN KEY (eid) REFERENCES exams(EID),
    FOREIGN KEY (email) REFERENCES users(email)
);
```

## Getting Started

To run the Student Assessment Portal locally or deploy it:

1. **Clone the repository**:

   ```bash
   git clone <https://github.com/iamcosmo/Student-Assessment-Portal.git>
   ```

2. **Database Setup**:

   - Create a MySQL database.
   - Import the SQL schema provided in `database-schema.sql`.

3. **Configuration**:

   - Configure the database connection in `application.properties` or similar configuration files.

4. **Run the Application**:

   - Build and run the application using Maven or your preferred build tool.

5. **Accessing the Portal**:

   - Open your web browser and navigate to `http://localhost:8080` (or configured port).

## Usage

### Admin Tasks

- **Login**: Access the admin dashboard.
- **Manage Question Sets**: Create, edit, and delete question sets.
- **Manage Questions**: Add, edit, and delete questions within sets.

### Student Tasks

- **Login**: Access the student portal.
- **Take Assessments**: View available assessments and complete them.

## Example Queries

### Inserting a Question Set and Questions

```sql
INSERT INTO question_set (name) VALUES ('Java');

INSERT INTO question (question, a, b, c, d, answer, set_id) VALUES

('Which company developed Java?', 'Microsoft', 'Apple', 'Sun Microsystems', 'Oracle', 'c', 1),
('Which of these is not a Java keyword?', 'static', 'Boolean', 'void', 'private', 'b', 1),
('Which edition of Java is used to develop mobile applications?', 'Java SE', 'Java EE', 'Java ME', 'Java FX', 'c', 1),
('What is the size of an int variable in Java?', '3 bytes', '2 bytes', '8 bytes', '16 bytes', 'a', 1),
('Which of the following is used to find and fix bugs in Java programs?', 'JVM', 'JRE', 'JDK', 'JDB', 'd', 1),
('What is the return type of the hashCode() method in the Object class?', 'int', 'Object', 'long', 'void', 'a', 1),
('Which package contains the Random class?', 'java.util', 'java.lang', 'java.io', 'java.net', 'a', 1),
('An interface with no fields or methods is known as a ____.', 'Serializable Interface', 'Abstract Interface', 'Marker Interface', 'CharSequence Interface', 'c', 1),
('Which of the following is a marker interface?', 'Runnable', 'Remote', 'Readable', 'Result', 'b', 1),
('Which method can be defined only once in a program?', 'main method', 'finalize method', 'static method', 'private method', 'a', 1),
('What will be the output of the following code snippet: int a = 5, b = 10; System.out.println(++a + b++);', '16', '15', '17', 'None of the above', 'c', 1),
('What will be the output of the following code snippet: int x = 10; if(x == 10) { int x = 20; System.out.println(x); } System.out.println(x);', '10 10', '20 10', '20 20', 'None of the above', 'b', 1),
('Which of the following is not a feature of Java?', 'Object-oriented', 'Use of pointers', 'Portable', 'Dynamic', 'b', 1),
('What is the extension of compiled Java classes?', '.java', '.js', '.class', '.cpp', 'c', 1),
('Which of the following is a superclass of every class in Java?', 'ArrayList', 'Abstract class', 'Object class', 'String', 'c', 1),
('What is the default value of a local variable?', '0', 'null', 'depends on the data type', 'no default value', 'd', 1),
('What is the output of the following code snippet: String s1 = "abc"; String s2 = "abc"; System.out.println(s1 == s2);', 'true', 'false', 'Compilation Error', 'None of the above', 'a', 1),
('Which keyword is used for accessing the features of a package?', 'import', 'package', 'extends', 'export', 'a', 1),
('Which of the following is not a type of constructor?', 'Default Constructor', 'Parameterized Constructor', 'Copy Constructor', 'Friend Constructor', 'd', 1),
('Which keyword is used for method overloading in Java?', 'override', 'overload', 'extends', 'None of the above', 'd', 1),
('Which of the following is not a Java feature?', 'Object-oriented', 'Use of pointers', 'Portable', 'Dynamic', 'b', 1),
('Which of the following is not a Java feature?', 'Object-oriented', 'Use of pointers', 'Portable', 'Dynamic', 'a', 1);
```
## Usage

### Running the Application

1. **Setting Up the Database**:
   - Execute the SQL scripts to create the `question` and `question_set` tables.
   - Optionally, populate the `question` table with sample data.

2. **Building and Deploying the Application**:
   - Ensure you have Maven installed (`mvn clean install`).
   - Deploy the application to your Tomcat server or any other servlet container.

3. **Configuring Database Connection**:
   - Locate your application configuration file for database settings. For example:
     - **Spring MVC Configuration (`webapp/WEB-INF/spring-servlet.xml`):**
       ```xml
       <bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
           <property name="driverClassName" value="com.mysql.cj.jdbc.Driver"/>
           <property name="url" value="jdbc:mysql://localhost:3306/studentzone"/>
           <property name="username" value="root"/>
           <property name="password" value="yourpassword"/>
       </bean>
       ```

4. ## Accessing the Application:
   ```
   - Open your web browser.
   - Navigate to the URL where your application is deployed.
   ```

5. ## Administrator Login:
    ```
       - Login as an administrator to manage question sets and questions
    ```


### Question count
```sql
   ALTER TABLE question_set
   ADD COLUMN question_count INT;
```

### subject intrest table

```sql
   CREATE TABLE subject_interest (
    student_email VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL PRIMARY KEY,
    subjects TEXT,
    FOREIGN KEY (student_email) REFERENCES users(email)
   );
```
   
### subject_tag table

```sql
   CREATE TABLE subject_tag (
       id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(255) NOT NULL
     );

```

### subjecttag_setid table

```sql
    CREATE TABLE subjecttag_setid (
        set_id INT,
        subject_tag_id INT,
        PRIMARY KEY (set_id, subject_tag_id),
        FOREIGN KEY (set_id) REFERENCES question_set(id),
        FOREIGN KEY (subject_tag_id) REFERENCES subject_tag(id)
    );
```

