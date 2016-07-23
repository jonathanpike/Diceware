# Custom Diceware Generator

A while ago, I read about Dr. Drang's [shell commands that generate diceware-like passwords from text files](http://leancrew.com/all-this/2015/04/passphrases-via-shell-pipeline/).  This is a great idea, but I wanted to do it in Ruby.  

## Useage: 

![Demo Gif](https://github.com/jonathanpike/Diceware/blob/master/demo.gif)

1. Download `diceware.rb`.  You can remove the `.rb` file extension, and then symlink the file to your /usr/local/bin/ directory like so: ln -s $PWD/diceware /usr/local/bin/

2. Next, you'll need to get a plain text file with a number of unique words.  I suggest anything from [Project Gutenberg](https://www.gutenberg.org), although I'm partial too [Pride and Prejudice](https://www.gutenberg.org/ebooks/42671).

3. Open a terminal and type `diceware` to launch the script.  It will ask you for a file.  If you're on a Mac, you can simply drag a file into your terminal to give it the filename.  It will then ask you for the length of the password.  

4. That's it!  It can copy your new password to the clipboard, if you choose. 
