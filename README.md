# Custom Diceware Generator

Inspired by Dr. Drang's [shell commands that generate diceware-like passwords from text files](http://leancrew.com/all-this/2015/04/passphrases-via-shell-pipeline/), I wanted to create a script to do the same with Ruby.  

## Usage 

```
Usage: diceware.rb [options...] <file name>

Options
    -w, --words [NUM]                number of words the password will contain (default 6)
    -a, --average [NUM]              randomize password generation further (default 6)
    -v, --verbose                    show verbose output
        --copy                       copies result to clipboard

        --version                    show version number
    -h, --help                       show this help
``` 