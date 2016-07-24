# Custom Diceware Generator

A while ago, I read about Dr. Drang's [shell commands that generate diceware-like passwords from text files](http://leancrew.com/all-this/2015/04/passphrases-via-shell-pipeline/).  This is a great idea, but I wanted to do it in Ruby.  

## Usage 

![Demo Gif](https://github.com/jonathanpike/Diceware/blob/master/demo.gif)

1. Download `diceware.rb`.  You can remove the `.rb` file extension, and then symlink the file to your /usr/local/bin/ directory like so: `ln -s $PWD/diceware /usr/local/bin/diceware`

2. Next, you'll need to get a plain text file with a number of unique words.  I suggest anything from [Project Gutenberg](https://www.gutenberg.org), although I'm partial too [Pride and Prejudice](https://www.gutenberg.org/ebooks/42671).

3. Open a terminal and type `diceware` to launch the script.  It will ask you for a file.  If you're on a Mac, you can simply drag a file into your terminal to give it the filename.  It will then ask you for the length of the password.  

4. That's it!  It can copy your new password to the clipboard, if you choose. 

## License 

The MIT License (MIT)
Copyright (c) 2016 Jonathan Pike

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
