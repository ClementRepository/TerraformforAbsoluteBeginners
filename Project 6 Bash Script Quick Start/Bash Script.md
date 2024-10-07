# Bash scripting
## What is this?
Bash scripting allows the user to execute commands in sequence from one file and automate different tasks accordingly.

## Objective
You will be able to create bash scripts using Linux Commands from previous lessons.

## Vocabulary
- bash: A Shell program that processes commands in the Linux Terminal.
- Shebang: The first line of a bash script, forming a path to the bash system.
- .sh: The regular file type name used for denoting a bash script.
- string: a sequence of characters that represents text for programming purposes, enclosed within quotation marks.

## Links
[freecodecamp bash](https://www.freecodecamp.org/news/bash-scripting-tutorial-linux-shell-script-and-command-line-for-beginners/)

[learnlinuxtv youtube](https://www.youtube.com/playlist?list=PLT98CRl2KxKGj-VKtApD8-zCqSaN2mD4w)

## Explanation and Examples
A bash script essentially allows someone to run tasks automatically and thus raise efficiency in getting started. We will go over a few visual example below that shows how that works, as well as different ways to use the bash script.

Usually after you write a bash script, you will need to use the ```chmod``` followed by the file permissions, then the file name.

```chmod u+x script.sh``` to give execute permissions to the user.

Then ```./script.sh```, in which ```./``` means to execute ```script.sh```.



## Parts of a Bash Script and Possible Variations
_Note: Example bash scripts are attached for your reading._

**Shebang:** A bash script starts with a shebang, usually #!/bin/bash. This basically allows the system to know that this file is a bash script with that shebang.

**Comments:** Sometimes developers want to have a line that explains something within the script, so they might add a # before writing a sentence. Doing so prevents your computer from executing it as a command. If you remove the # sign, it will read that line as a command.

```
    #!/bin/bash
    #this is a comment, and the command is below.
    echo "This is a command, since it doesn't start with a # sign."
```

____________________________________________
**Variables:** Variables help a user store data as they write the script, replacing an item so that it can be placed within other parts of the script to keep it going. Usually it has an = sign to begin with. Once you set up a variable, when you write it into the script, you'll need to have a ```$``` prior to the variable. 

**If Statements:** If statements help check if something is true before executing another command, while ```else``` also tells what happens if the condition isn't met.

```
#!/bin/bash
if [condition is true];
then
execute commands
else
execute these commands instead
fi
```

Explanation: After the shebang on the first line, the "if" line has a condition in brackets that would activate the next "then" line command if it is met. If that condition is not met, then the command in the "else" line would be executed instead. Finally, fi basically means to finish the if/else statement.

```
 #!/bin/bash

age=22

if [ $age -gt 20 ]
then
echo "You are older than 20."
else
echo "You are not older than 20."
fi
```

In this example, age=22 is the variable. When age is put into the brackets, it needs to have $ before it so that the computer can understand that the variable is in place, in this case, $age shows that it equals 22. Inside the condition bracket, there is a "gt". When comparing a number, there are several possibilities:

```eq``` means equal to

```gt``` means greater than

```ge``` means greater or equal to

```le``` means less than or equal to

```lt``` means less than

```ne``` means not equal to

When comparing non-numbers(called string for this example), make sure you have double brackets for the below characters.
```=``` means equal to (make sure there are spaces between the = )

```!=``` means not equal to.

```<``` less than

```>``` greater than

Here's an example below for string variables.

```
#!/bin/bash
word="nice"
if [[ $word = "nice" ]]
then echo "That's very nice."
else
echo "That's not nice."
fi
```

The output would say ```"That's very nice."``` when you execute it since the word variable did in fact equal to nice. Remember to have quotation marks around a string variable!
__________________________________________

**While loops:** As long as something is true, then a command will keep executing, such as having a variable or when you need user input. 

**For loops:** This is meant to run a loop for a certain number of times. In contrast to while loops, for loops should be used if you know how many times something needs to run.

**User input:** Sometimes a script can ask someone to input information and then be able to execute another command.


## Exercises
### Exercise 1:
- Create a text file (add .txt to its name) called Test. Check its permissions. Change its permissions to allow all users the ability to read, write and execute the file.
### Exercise 2:
- Using the text file (Test.txt) from exercise 1, remove write and execute permissions from groups and others. Check its permissions afterward to confirm.