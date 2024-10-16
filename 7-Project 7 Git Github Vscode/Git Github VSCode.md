# Using Git, Github, and VsCode
## What is this?
Git is meant to handle projects of varying sizes and tracking changes in code. Github uses Git to store projects and code so that developers can share and work on projects together. Visual Studio Code, or VsCode, is a code editor where users can integrate different programs and programming languages to complete their coding needs.

_Note: VsCode isn't required to do the work, however, it is widely used because of its many tools and abilities packed in it._

## Objective
You will be able to download Git and commit your work, create and use a Github account, download VsCode, clone your work to your computer, and push content from VsCode into a Github Repository. In addition, you will clone the TerraformForAbsoluteBeginners repository for your own practice.


## Links
[w3schools git tutorial](https://www.w3schools.com/git/)

[git download](https://git-scm.com/downloads/win)

[git explanations and videos](https://git-scm.com/doc)

[git and github how they work together](https://docs.github.com/en/get-started/start-your-journey/about-github-and-git)

[learn vscode](https://www.youtube.com/watch?v=B-s71n0dHUk&list=PLj6YeMhvp2S5UgiQnBfvD7XgOMKs3O_G6)

[git with vscode](https://www.youtube.com/watch?v=i_23KUAEtUM&list=PLj6YeMhvp2S5UgiQnBfvD7XgOMKs3O_G6&index=2)

[github exercise for pull requests](https://docs.github.com/en/get-started/start-your-journey/hello-world)

## Vocabulary/Commands:

### Git Commands:
```git --version``` will tell you what version of git has been downloaded.

```git config``` will set up your git account. (Step 5 of Git Set up)

```git status``` allows you to look at the branch you're on, what files are on on track, and what is untracked.

```git add``` allows you to add files to be staged, or ready to be committed and pushed to Github. (Step 12 of Git Set Up)

```git commit -m``` sets up files that are already staged and thus commits to the repository.

```git branch``` sets up a different path for files to follow. (Step 15 of Git Set Up)

```git log``` checks what has been committed and pushed.

```git fetch origin``` takes commits, and files from a remote repository into your local repository.

```git checkout``` tells Git what branch or commit you want to apply changes to. (Step 16 of Git Set Up)

```git reset --soft``` resets a commit back to staging on your local machine.

```git clone``` makes a copy of the repository onto your own computer.

### Github Vocabulary

Pull Request: When pushing changes to a repository that isn't yours, it will become a pull request. The owner of that repository can accept or deny the pull request to update the file in question.

Repository/Repo: A storage area for code and files of a project.

Readme: Repositories usually have a readme file that explains what the project or repository is for.

Fork: Making a fork from a repository means you make a copy of that repository for your own testing purposes, within Github. You can then do the git clone function to get it on your own computer.

### VsCode Vocabulary

Explorer: The first option on the left of VsCode that shows a directory of files you're working on.

Extensions: The fifth option on the left of VsCode that allows you to install different tools to support your coding needs.

Source Control: The third option on the left of VsCode that tracks your changes, commits, and other git functions.

## Git Set Up
1. click the link [git download](https://git-scm.com/downloads/win) and download the latest Windows version of Git.
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
19. If it gives you an error message, use ```git push --set-upstream origin master``` or ```git push --set-upstream origin main```

![alt text](<git push example.jpg>)

## Github Set Up
1. Go to [github](github.com) and click sign up.
2. Sign up for an account.
3. When you're on the homepage, find your account profile picture on the top right. In this example it's green and white.

![alt text](Profile.jpg)

4. Click on the profile and click "Settings" from the dropdown.
5. There will be a section that says "SSH and GPG Keys" that you click found on the left. Click on "New SSH Key" to add one.

![alt text](<github ssh key.jpg>)

6. Find the "+" sign and it should have a drop down menu. Click and choose new repository.

![alt text](<Github Repository Creation.jpg>)

7. Once you get there, name your repository, make it either public or private (Private for our purposes for now), and check the box for "add a readme file." Click "Create Repository."

![alt text](<Github Repository Creation 2.jpg>)

8. On the right, there are several buttons to note. Fork, which makes a copy of the entire repository for your own usage on Github, and Code, which we will use for our next step.

![alt text](<test repository.jpg>)

9. Click on the green "code" button, where it will have a drop down menu. Choose SSH, copy the box underneath it.

![alt text](<Github ssh git clone.jpg>)

10. Go back to your terminal and run the command ```git clone``` followed by the SSH section you copied.

![alt text](<git clone terminal.jpg>)

11. Check to see if the Github repository has been added into wherever you cloned it. In the example case, the Test repository is present.

![alt text](<ls test.jpg>)

12. You can now be able to do the same with any repository to download files for your own usage. (It is recommended to git clone the repository that these projects are from.) As for your own repository, see step 17 onwards from Git Set Up section above this Github section.

## VsCode Set Up
1. Go to VsCode's download page [vscode download](https://code.visualstudio.com/download) and click Windows in blue to download.
2. Open up Visual Studio Code when it's done.
3. On the left, there is a logo with 5 squares, called extensions. Click on it.
4. When the search bar option is available, you need to search for "WSL" and "GitHub Pull Requests". Make sure both are installed.
5. After installing, on the bottom left of the vertical bar of the vscode window you should see a cog wheel and a person button. That should be the accounts button, where you click on it for a dropdown.  
6. There should be an option that says "Sign in with Github to use Github Pull Requests". Click on that.
7. It will open up your web browser, where you log in with your Github account. Once you log in, press continue if the information is correct.
8. Then click Authorize Visual Studio Code.
9. After that, go to VsCode again. If need be, click file on the top left and click new window. It will bring you to a welcome page.
10. Click "Clone Git Repository." It'll have a dropdown on the top search bar asking you to clone the repository from Github. Click that as well.

![alt text](<vscode new window.png>)

11. Then, click the repository that you had set up prior with the Github instructions. It will open up and ask you to set a folder for these files. Right click in the white space, choose new->folder from the drop down when it appears. Rename the folder to whatever you like by right clicking the new folder.
12. It will request authorization from Git Credential Manager. Authorize that as well. 
13. Once you have everything authorized, it should have your readme file listed. See picture below.
14. After everything is set, you can drag the bottom of VsCode up (where it will show an up and down arrow) to open up its own terminal. It should initially say "powershell", but you can find an arrow that will open up a drop down menu (that originally says Launch Profile, next to a plus sign). Choose Ubuntu WSL to start using the terminal.

![alt text](<vscode terminal.jpg>)

15. After that, you will see that the terminal is open to the folder that you cloned the repository to.

## Git Cloning TerraformForAbsoluteBeginners
To clone the repository that all these files reside, follow these instructions.
Prior to changing the contents of these files (assuming your Github account is now linked to VSCode):
1. Go to [TerraformForAbsoluteBeginners Github](https://github.com/Clemchowdah/TerraformforAbsoluteBeginners) and press the fork button.
2. In Vscode, open a new window and click "Clone Git Repository". In the dropdown, click "Clone from Github".
3. Choose the correct repository to clone. You'll need to right click when it asks a folder to clone into, and press "new", and rename the folder. Select that folder as the repository destination. (It is probably best to keep the folder name as TerraformForAbsoluteBeginners to make it easier to remember.)


## VsCode Push files to Github Example:
### Goal: You will be able to commit and push a file to your repository.
1. Under file on the top left of VsCode, choose new text file. Type something in and save it.
2. You might see a little "1" on the left bar. Hover over it (Source Control) and click it.
2. When you click on source control, you'll initially see a message section (similar to ```git commit -m```), and a commit button. Directly above the message section, next to source control, hover near it to find a different ... option. Right click that to see a drop down menu. 
3. You will see options to pull, push, commit, among other options.
4. Under "Changes", where you'll see a "1" as well, hover over the file name. Click the "+" sign to stage it.
5. If you want to unstage or discard the changes, click the arrow that shows up when you hover over the file name.
6. After staging the changes, a new section will say staged changes with your file.

![alt text](<staged changes.png>)

7. Set a message such as "hello!"
8. Click the ... near source control, and choose pull.
9. Then, where it says "commit", click the arrow drop down button and click commit and push.
10. If you ever make a mistake, the same ... near source control has an "undo last commit" option when you see "commit" in that drop down.
11. Lastly, the bottom section on the left can be dragged upward to show what git pushes have happened.


_**Troubleshooting Note: Sometimes there's an error that states that git username and email haven't been set up despite doing so earlier in the steps when you try to commit from VsCode.**_

_Do ```git config --global -e``` in your terminal and it will open up a text editor that will allow you to change your username and email with the global option manually. Ctrl x, then y to leave and save that._

