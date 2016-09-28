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

## License 

The MIT License (MIT)
Copyright (c) 2016 Jonathan Pike

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
