# template.sh

> Is a shell script to build files using handlebars, it runs and injects
> shell commands directly into the input file, so you can use any installed
> program to help creating the content.


## Installation

Clone and run `make`, the default install location is *~/.local/bin*, you
can pass a `PREFIX` to the *make* command to override it:

`PREFIX=/usr/local make`

will install the script in */usr/local/bin*.


## Using

Running `template` will read from standard input and print to standard output,
passing a file as argument will process that file, e.g

`template index.tpl`

The result is printed to standard output, to write it to a file you
should use a redirection:

`template index.tpl > index.html`

**Note:** only files with *.tpl* are interpreted, all other extensions are simply
printed verbatim.

For more information run `template -h` for help.


### Handlebars

To use command substitution write `{{some command}}` in a *.tpl* file,
this file will be processed and the line containing the command will be
replaced by the command output, e.g.:

*banner.txt.tpl*:
```
this is some text.
{{echo cowsay Hi!}}

And some more text.
```

Running `template banner.txt.tpl` on the folder will output the content:

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


### Calling other templates

Using `{{template file}}` on a template will make this line be replaced by the contents
of *file*. For example:

*greet.txt*:
```
Hi, nice to meet you!
```

*body.txt.tpl*:
```
{{template greet.txt}}

This is the body.

Bye.
```

Will generate:

```
Hi, nice to meet you!

This is the body.

Bye.
```


### Passing arguments

You can also pass arguments to template, and that is added to commands:

*main.tpl*:
```
{{template name.tpl John}}

This is the body.

Bye.
```

*name.tpl*:
```
Hello {{echo $1}}.

Bye.
```

Should output:

```
Hello John.

This is the body.

Bye.
```

### Multiline commands

Commands that span multiple lines are also supported, good for writting
for loops.

Take a look at this for a complete example:
[index.html.tpl](https://github.com/blmayer/blog/blob/main/www/index.html.tpl#L20).


## Notes

This is a work in progress and some things will change, for the better I hope.
