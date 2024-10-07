# Bash scripting
## What is this?
Bash scripting allows the user to execute commands in sequence from one file and automate different tasks accordingly.

## Objective
You will be able to create simple bash scripts using Linux Commands from previous lessons.

_Note: This is only considered a basic guide, it is recommended to watch or read links from the below section for more detailed lessons."_
## Vocabulary
- bash: A Shell program that processes commands in the Linux Terminal.
- Shebang: The first line of a bash script, forming a path to the bash system.
- .sh: The regular file type name used for denoting a bash script.
- string: a sequence of characters that represents text for programming purposes, enclosed within quotation marks.
- ```read```: read is a command that takes whatever a user may type in, or input, and stores it within a variable for other uses.
- ```Ctrl C```: pressing ctrl, and c together will allow you to leave the current function if you get stuck.

## Links
[freecodecamp bash](https://www.freecodecamp.org/news/bash-scripting-tutorial-linux-shell-script-and-command-line-for-beginners/)

[learnlinuxtv youtube](https://www.youtube.com/playlist?list=PLT98CRl2KxKGj-VKtApD8-zCqSaN2mD4w)

## Explanation 
A bash script essentially allows someone to run tasks automatically and thus raise efficiency in getting started. We will go over a few visual example below that shows how that works, as well as different ways to use the bash script.

Usually after you write a bash script, you will need to use the ```chmod``` followed by the file permissions, then the file name.

```chmod u+x script.sh``` to give execute permissions to the user.

Then ```./script.sh```, in which ```./``` means to execute ```script.sh```.




## Parts of a Bash Script and Possible Variations


**Shebang:** A bash script starts with a shebang, usually #!/bin/bash. This basically allows the system to know that this file is a bash script with that shebang.

**Comments:** Sometimes developers want to have a line that explains something within the script, so they might add a # before writing a sentence. Doing so prevents your computer from executing it as a command. If you remove the # sign, it will read that line as a command.

```
    #!/bin/bash
    #this is a comment, and the command is below.
    echo "This is a command since it doesn't start with a # sign"
```

____________________________________________

**Variables:** Variables help a user store data as they write the script, replacing an item so that it can be placed within other parts of the script to keep it going. Usually it has an = sign to begin with. Once you set up a variable, when you write it into the script, you'll need to have a ```$``` prior to the variable. 

**If Statements:** If statements help check if something is true before executing another command, while ```else``` also tells what happens if the condition isn't met. The condition is in the bracket (double bracket if it's a string rather than comparing numbers.)

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

In this example, age=22 is the variable. When age is put into the brackets, it needs to have $ before it so that the computer can understand that the variable is in place, in this case, $age shows that it equals 22. Inside the condition bracket, there is a "gt" (make sure there's a "-" before it). When comparing a number, there are several possibilities:

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

Since the variable is a string (mind the quotation marks for string), there is a double bracket for the variable condition. ```$word = "nice"``` so,the output would say ```"That's very nice."``` when you execute it since the word variable did in fact equal to nice. **Remember to have quotation marks around a string variable, and double bracket the condition!**
__________________________________________

**While loops:** As long as something is true, then a command will keep executing, such as having a variable or when you need user input. 

**For loops:** This is meant to run a loop for a certain number of times. In contrast to while loops, for loops should be used if you know how many times something needs to run.

While loops follow a certain syntax-as long as a condition is seen as true, it will keep doing the commands listed underneath. See below:

```
#!/bin/bash
while [ condition ];
do
    command1
    command2
done
```
Multiple commands can be run one after another while the condition is met. ```do``` basically works like the ```then``` command from before. Unlike if/then bash scripts, while and for use ```done``` at the end. Let's look at an example filled in:

```
#!/bin/bash
number=1
while [ $number -le 5 ]; 
do
echo "The Number is: $number"
((number++))
done
```

In this example, the variable is set as number, equal to 1. While the number is less than or equal to 5, it would echo an output that will tell you the number. Under the echo command, the ```((number++))``` means that the variable, in this case number, would increment/increase by 1. You can also do ```((number+=1))```.

Conversely, if you wanted to decrease the number, you can make a bash script using the ```until``` command:
```
#!/bin/bash
number=5
until [ $number -le 0 ];
do
echo "The Number is: $number"
((number--))
done
```

For loops, in contrast to while loops, will go through information given repeatedly, whether it be numbers or a command.

```
#!/bin/bash
for i in {1..8}
do
echo "This has worked $i times."
done
```
In the above example, the variable i is whatever number is in the range of 1 to 8. You'd use curly brackets to keep a range, (or type 1 2 3 4 5 6 7 8 without any brackets.) The output would be:

```
This has worked 1 times.
This has worked 2 times.
This has worked 3 times.
This has worked 4 times.
This has worked 5 times.
This has worked 6 times.
This has worked 7 times.
This has worked 8 times.
```

__________________________________________

**User input:** Sometimes a script can ask someone to input information and then be able to execute another command.

```
#!/bin/bash

read -p "Enter your name: " name
echo "Hello, $name! Welcome to the script."
```

This example uses the ```read``` command with a ```-p``` flag. This means that a prompt will be displayed and will wait for user input. When writing a prompt, make sure you have a space, then ```"```. This is the proper syntax for allowing input. For example, if it was ```"What is your age? "``` Think of the space between the ```?``` and the ```"``` as where you'd put in your age. What you type in (and press enter) will be considered as the "name" for the above example. Hence, $name will reference what you typed. Copy and paste this into an empty script file, change the permissions to allow execute, then run it!


## Steps for an example if/else with variable.
1. ```touch script.sh``` (name the script anything you want)
2. ```nano script.sh```
3. Add shebang ```#!/bin/bash``` to the first line
4. Add your variable if there is one.
5. Make an if statement with brackets
6. Write a then statement with a command
7. Write an else statement with a command
8. type ```fi``` to finish your bash script 
9. ```chmod +x script.sh``` to give permissions to execute
10. ```./script.sh``` to execute the script
 
## Exercises
### Exercise 1:
- Create a bash script file in your home directory. In that script, ask the user to input their age. Using an if/else statement, if they are above the age of 18, have the output tell them that they are an adult. If they are not above 18, have the output tell the user that they are not an adult.

_Answer is found in agequestion.sh in the same github folder._

### Exercise 2:
- Create a bash script file in your home directory that will ask the user how many siblings they have. Have the script create a file named 2.txt if they have 2 or more siblings, and a file named 1.txt if they have less than 2 sibling. 

_Answer is found in siblings.sh in the same github folder._