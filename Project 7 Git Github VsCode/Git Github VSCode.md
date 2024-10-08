# Using Git, Github, and VsCode
## What is this?
Git is meant to handle projects of varying sizes and tracking changes in code. Github uses Git to store projects and code so that developers can share and work on projects together. Visual Studio Code, or VsCode, is a code editor where users can integrate different programs and programming languages to complete their coding needs.

_Note: VsCode isn't required to do the work, however, it is widely used because of its many tools and abilities packed in it._

## Objective
You will be able to download Git, create and use a Github account, and download VsCode while pushing content from VsCode into a Github Repository.


## Links
[w3schools git tutorial](https://www.w3schools.com/git/)

[git download](https://git-scm.com/downloads/win)

[git explanations and videos](https://git-scm.com/doc)

[git and github how they work together](https://docs.github.com/en/get-started/start-your-journey/about-github-and-git)

## Vocabulary/Commands:
```git --version``` will tell you what version of git has been downloaded.

```git config```

```git status```

```git add```

```git commit -m```

```git branch```

```git log```

```git fetch origin```

```git branch```

untracked
repository
readme

## Git Set Up
1. click the link [git download](https://git-scm.com/downloads/win) and download the 64 bit Git for Windows Setup.
2. Install Git.
3. Open up Tabby Terminal or any terminal that can run WSL.
4. run the command ```git --version``` (If it has an output of git followed by a version, you're good to go!)
5. To configure git, run the command ```git config --global user.name``` followed by your desired username in the same command.
6. Next, run the command ```git config --global user.email``` followed by your email in this command.
7. Now, make a directory and change to that directory ```mkdir newdirectory``` and ```cd newdirectory```
8. Run ```git init``` to start git. It should say that it initialized an empty Git repository in a specific path.
9. Make any file and save. 
10. Run ```git status```. This should show the new file you made, as "untracked." This means that it's not yet in the repository.
11. Note that it will tell you what branch you currently are on. For the sake of this, make sure you are on the master branch.
12. Now, use the ```git add``` command followed by the file name that you have, such as ```git add file```, or ```git add --all``` if you want to add all of the files you have. 
13. Run ```git status``` and your file will show up under "changes to be committed." The files are now considered staged, i.e. ready to commit. If you want to remove the file, you can run ```git rm --cached``` followed by the file name in the command.
14. Run ```git commit -m``` followed by a message in quotation marks. See below.

![alt text](<git commit -m.jpg>)

15. Note that all this time you're on a branch called "master", as noted in step 11. If you don't want to make changes directly there (to not mess up anything in the shown branch), you can use the ```git branch``` followed by whatever name you want for the new branch. This will create a new branch with the new name.
16. You can always use the ```git checkout``` command followed by the branch name you want. For example, if you want to go back to the master branch, it would be ```git checkout master```. Run a ```git status``` to check the branch you are on.

_Note: For anything that is meant to be presented or deployed, that's the master branch. Make a new branch for just testing your work._

17. Follow these next steps after you've done the Github set up section.
18. To push changes from something you've worked on to github, you can do ```git push origin``` after you've done ```git commit -m```.
19. If it gives you an error message, use ``` git push --set-upstream origin master``` or ```git push --set-upstream origin main```

![alt text](<git push example.jpg>)

## Github Set Up
1. Go to [github](github.com) and click sign up.
2. Sign up for an account.
3. Find the "+" sign and it should have a drop down menu. Click and choose new repository.

![alt text](<Github Repository Creation.jpg>)

4. Once you get there, name your repository, make it either public or private (Private for our purposes for now), and check the box for "add a readme file." Click "Create Repository."

![alt text](<Github Repository Creation 2.jpg>)

5. On the right, there are several buttons to note. Fork, which makes a copy of the entire repository for your own usage on Github, and Code, which we will use for our next step.

![alt text](<test repository.jpg>)

6. Click on the green "code" button, where it will have a drop down menu. Choose SSH, copy the box underneath it.

![alt text](<Github ssh git clone.jpg>)

7. Go back to your terminal and run the command ```git clone``` followed by the SSH section you copied.

![alt text](<git clone terminal.jpg>)

8. Check to see if the Github repository has been added into wherever you cloned it. In the example case, the Test repository is present.

![alt text](<ls test.jpg>)

9. You can now be able to do the same with any repository to download files for your own usage. As for your own repository, see step 17 onwards from Git Set Up section above this Github section.

## VsCode Set Up


## Exercises
### Exercise 1:
