# Signing up for Amazon Web Services
## What is this?
Amazon Web Services is a widely used cloud provider that hosts many services for the purpose of automation, machine learning, and infrastructure services, to name a few. AWS will be at the core of the projects listed within this repository.

## Free Tier Notes
AWS has resources that are under the "Free Tier," of which you can use for free up until you hit the particular limit of said resource. To learn more, click this link: [aws.amazon.com/free](https://aws.amazon.com/free)

## Objective
You will be able sign up for an AWS account, find your public key, and import your public key into the AWS account. This will allow you to connect to AWS in other projects through your terminal.

## Vocabulary/Additional Reading
- Key pair: [Key Pair](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html) Do not ever share your private key.
- Directory: a folder or container in your computer that organizes files and other directories.
- Ssh: also called secure shell, where it is used to access/login remotely from another device.
- Output: the information that is displayed when you execute a command in the terminal.
- Tag: [Tag](https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/what-are-tags.html) In AWS, assigning a tag (name) to an item, such as a key pair, will allow for better management and organization of resources.

## Terminal Linux Commands to Practice (description in parentheses)
- ```wsl``` (typing wsl when starting your tabby terminal will start up wsl)
- ```cd``` (typing cd followed by the name of your directory will change the directory TO that directory. For example, ```cd ~``` changes the directory to what is called the home directory, while ```cd ..``` changes to the previous directory.)

- ```ls``` (allows you to look at files within the current directory. ```ls -l``` shows a long form list, while ```ls -a``` shows hidden files.)
- ```cat``` (typing cat, followed by a file name, will display the contents of the file as an output. For example, if you have a file named hello.txt in the current/working directory, you would type ```cat hello.txt``` and it will display its contents.)
## Steps
1. On your browser (Edge, Chrome, Firefox, etc), type in https://aws.amazon.com/ or click this link [AWS Site](https://aws.amazon.com/).
2. Click on the "Create an AWS Account" button on the top, which will take you to another page.
3. You will see a "sign up for AWS" heading asking for your email and to make an AWS account name.
4. Sign up for an account. You'll need an email, address, name, phone number, billing information, etc.
5. After you sign in, you'll be able to view the console, or dashboard of your AWS account.
6. Navigate to the search bar within the console. As of this writing, it is at the top. Type in "Key pairs", and you can click on the option that pops up- it should say ec2 feature under it.
7. Find the "create key pair" button. Next to it, there's an "actions" drop down. Click on "actions", and then choose "import key pair". The following section should appear:
![alt text](<importkeypair.jpg>)

8. Enter a name for your key pair.
9. Open up your tabby terminal if you haven't. Type ```wsl``` to start WSL.
10. Type ```cd ~``` to go to your home directory.
11. Type ```cd .ssh``` to go into your ssh directory.* (See Note at the bottom of the instructions if you don't see .ssh)
12. Type ```ls``` to see files in there. You will see id_ed25519.pub, which is where your public key is located.
13. Type ```cat id_ed25519.pub```
14. Copy and then paste the output of step 13 into the "import key pair" (key pair file) box. 
15. Additionally, you can add a tag to the key pair. Then, click "import key pair" to finalize your key pair connection.

_Note: * For Step 11, if your terminal does not show a .ssh directory, you can create a key pair using the command ```ssh-keygen```. Press enter to make the file, you can add a passphrase when it asks for security purposes as well. Copy the key fingerprint it gives you. Now you can change directory to .ssh and follow from steps 12 onward._
