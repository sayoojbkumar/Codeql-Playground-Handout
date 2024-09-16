# Turbocharge your secure code reviews using CodeQL

### Instructions
1. Install [https://code.visualstudio.com/](VSCode). 
2. Install [https://marketplace.visualstudio.com/items?itemName=github.vscode-codeql](VSCode CodeQL extension). 
3. Clone this repository to your local machine. 
4. Clone [https://github.com/WebGoat/WebGoat](Webgoat) project to your local machine. 
4. There will be several folders inside this workshop Dir:
    - All the challenges and exercises which will be used in the workshop are structured. 
    - Challenges folder contains all the CTF challenges. 
    - Exercises folder contains all the follow along exercises for the workshop. 
    - The folder named custom-codeql-queries is ready for your to developing your CodeQL queries for Java. 


Note - Solutions for the CTF will be pushed after the workshop for attendees to go through it.


### Useful Commands 

1. Setting up $JAVA_HOME in MacOS/Unix:
    - /usr/libexec/java_home -V
    - export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
    - echo $JAVA_HOME

2. CodeQL pack resolve
3. Codeql pack install 
4. codeql database create codeql_db_name --language=java (Run this command inside the project dir)
5. codeql database analyze --output=result --fomat=csv



### Important References

[https://codeql.github.com/docs/codeql-language-guides/codeql-for-java/](CodeQL for Java/Kotlin)

[https://github.com/github/codeql/tree/main/java](Pre-defined CodeQL libraries)

[https://codeql.github.com/codeql-standard-libraries/java/](Standard CodeQL libraries for Java)



### TBD:

- A workshop handout for trainers. 
