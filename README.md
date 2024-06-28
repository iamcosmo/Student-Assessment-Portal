# Student-Assessment-Portal

## Database Schema

### `question` Table

```sql
CREATE TABLE question (
    id INT NOT NULL AUTO_INCREMENT,
    question TEXT NOT NULL,
    a VARCHAR(255) NOT NULL,
    b VARCHAR(255) NOT NULL,
    c VARCHAR(255) NOT NULL,
    d VARCHAR(255) NOT NULL,
    answer CHAR(1) NOT NULL,
    PRIMARY KEY (id)
);

-- Inserting programming-related questions for id 1, 2, and 3
INSERT INTO question (id, question, a, b, c, d, answer) VALUES
(1, 'Which company developed Java?', 'Microsoft', 'Apple', 'Sun Microsystems', 'Oracle', 'c'),
(2, 'Which of these is not a Java keyword?', 'static', 'Boolean', 'void', 'private', 'b'),
(3, 'Which edition of Java is used to develop mobile applications?', 'Java SE', 'Java EE', 'Java ME', 'Java FX', 'c');

-- Inserting the rest of the questions
INSERT INTO question (id, question, a, b, c, d, answer) VALUES
(4, 'What is the size of an int variable in Java?', '3 bytes', '2 bytes', '8 bytes', '16 bytes', 'a'),
(5, 'Which of the following is used to find and fix bugs in Java programs?', 'JVM', 'JRE', 'JDK', 'JDB', 'd'),
(6, 'What is the return type of the hashCode() method in the Object class?', 'int', 'Object', 'long', 'void', 'a'),
(7, 'Which package contains the Random class?', 'java.util', 'java.lang', 'java.io', 'java.net', 'a'),
(8, 'An interface with no fields or methods is known as a ____.', 'Serializable Interface', 'Abstract Interface', 'Marker Interface', 'CharSequence Interface', 'c'),
(9, 'Which of the following is a marker interface?', 'Runnable', 'Remote', 'Readable', 'Result', 'b'),
(10, 'Which method can be defined only once in a program?', 'main method', 'finalize method', 'static method', 'private method', 'a'),
(11, 'What will be the output of the following code snippet: int a = 5, b = 10; System.out.println(++a + b++);', '16', '15', '17', 'None of the above', 'c'),
(12, 'What will be the output of the following code snippet: int x = 10; if(x == 10) { int x = 20; System.out.println(x); } System.out.println(x);', '10 10', '20 10', '20 20', 'None of the above', 'b'),
(13, 'Which of the following is not a feature of Java?', 'Object-oriented', 'Use of pointers', 'Portable', 'Dynamic', 'b'),
(14, 'What is the extension of compiled Java classes?', '.java', '.js', '.class', '.cpp', 'c'),
(15, 'Which of the following is a superclass of every class in Java?', 'ArrayList', 'Abstract class', 'Object class', 'String', 'c'),
(16, 'What is the default value of a local variable?', '0', 'null', 'depends on the data type', 'no default value', 'd'),
(17, 'What is the output of the following code snippet: String s1 = "abc"; String s2 = "abc"; System.out.println(s1 == s2);', 'true', 'false', 'Compilation Error', 'None of the above', 'a'),
(18, 'Which keyword is used for accessing the features of a package?', 'import', 'package', 'extends', 'export', 'a'),
(19, 'Which of the following is not a type of constructor?', 'Default Constructor', 'Parameterized Constructor', 'Copy Constructor', 'Friend Constructor', 'd'),
(20, 'Which keyword is used for method overloading in Java?', 'override', 'overload', 'extends', 'None of the above', 'd'),
(22, 'Which of the following is not a Java feature?', 'Object-oriented', 'Use of pointers', 'Portable', 'Dynamic', 'b');
