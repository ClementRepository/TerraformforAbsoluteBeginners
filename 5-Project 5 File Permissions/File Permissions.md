# Learning How to Change File Permissions
## What is this?
Changing a file's permissions is important for security purposes, so that someone can allow someone to just read a file, or edit, or execute said file.

## Objective
You will be able to create a file and change its permissions accordingly using the symbolic method. This will be used later on in the Docker project sections.*

_*Note: The reading links go over the symbolic method and absolute version/octal version of the chmod command, but the exercises will use the symbolic method only. Please read the reading links for a more detailed explanation._

##  Reading Links
- [freecodecamp](https://www.freecodecamp.org/news/linux-chmod-chown-change-file-permissions/)
- [Indiana University](https://servicenow.iu.edu/kb?id=kb_article_view&sysparm_article=KB0023940)
## Vocabulary/Commands
- ```chmod```: this command changes the permissions of a file. The basic syntax would be ```chmod permissions file```.
- ```chown```: this command changes ownership of a file. The basic syntax would be ```sudo chown user file```. 
- script: a text file that has commands that can be executed. The one used by most Linux distributions would be the bash script, which will be covered in a later section.

## Explanation of File Ownership
### User/Owner: (u)
-user/owner created the file
### Group (g)
-collections of users that have the same group permissions
### Other (o)
-users not classified to the other two owner types
### All (a)
-all the above

## Explanation of File Permissions
There are three sections for permissions: read(r), write(w), and execute(x). To clarify, write means to be able to change something, execute means to be able to run the script.
If you type ```ls -l``` you'll be able to see directories and their specific permissions allowed to their users.
To change permissions, you would need to use the ```chmod``` command followed by the letter denoting the ownership classes (u, g, o, a, with a + sign to add access, - sign to remove access, or = to set equal access.)
### Examples
```chmod u+x file1``` would give execute permissions to the user in regards to file1.

```chmod g+w file1``` would give write permissions to a group in regards to file1.

```chmod u-x file1``` would remove execute permissions to the user in regards to file1.

## Exercises
### Exercise 1:
- Create a text file (add .txt to its name) called Test. Check its permissions. Change its permissions to allow all users the ability to read, write and execute the file.
### Exercise 2:
- Using the text file (Test.txt) from exercise 1, remove write and execute permissions from groups and others. Check its permissions afterward to confirm.