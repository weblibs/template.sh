# template.sh

> Is a shell script to build files using handlebars, it runs and injects
> shell commands directly into the ouput file, so you can use any installed
> program to help creating the content.


## Installation

Clone and run `make`, the default install location is *~/.local/bin*, you
can pass a `PREFIX` to the *make* command to override it:

`PREFIX=/usr/local make`

will install the script in */usr/local/bin*.


## Using

Running `template` in a folder will make it read and process all files,
recursively, so be carefull, and will generate the same structure in the
*out* folder. The best way is to point to a folder:

```
template static
```

will process all files inside *static/* and write them into *out/*.


### Handlebars

To use command substitution write `{{! some command}}` in a *.tpl* file,
this file will be processed and the line containing the command will be
replaced by the command output, e.g.:

*banner.txt.tpl*:
```
this is some text.
{{! cowsay Hi!}}

And some more text.
```

Running `template` on the folder will generate *out/banner.txt* with the
content:

*out/banner.txt*:
```
this is some text.
 _____ 
< Hi! >
 ----- 
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||


And some more text.
```

If you have `cowsay` installed on your system.


Using `{{file}}` on a template will make this line be replaced by the contents
of *file*. For example:


*greet.txt*:
```
Hi, nice to meet you!
```

*body.txt.tpl*:
```
{{greet.txt}}

This is the body.

Bye.
```

Will generate:

*body.txt*:
```
Hi, nice to meet you!

This is the body.

Bye.
```

And also a copy of *greet.txt*.


## Notes

This is a work in progress and some things will change, for the better I hope.

