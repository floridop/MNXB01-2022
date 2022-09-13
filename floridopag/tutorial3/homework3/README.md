--------------------------------------------------------
# MNXB01-2022-homework3
--------------------------------------------------------
### Author: Florido Paganelli florido.paganelli@hep.lu.se
###         Lund University
--------------------------------------------------------

## Overview 

In this homework you're required to write a bash script called `filechecker.sh` 
that does the following: 

1) Takes as input **a URL** (Unified Resource Locator, an internet address)
2) Downloads the webpage or file located at that internet address into  a *temporary file*;
3) Runs the command `file` on the temporary file twice, one to print out
   the basic filetype info, one to print out the MIME type
4) Deletes the temporary file

If any of the above steps encounters an error, prints the error on screen
and exits with error exit code.

If the user forgets the parameter, the script should print an error and
exit with error code.

## The problem

You want to know the format of the file you are downloading 
(see slides about file format for a better understanding) , and its
*MIME type*. 

The MIME type is some special text that your browser checks
to decide which application is best suited to open a given file.

For example, pdf files have MIME type
    `application/pdf; charset=binary`

It is not required for the homework, but you can read more about 
MIME types at 
<https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types>

## How to proceed

Rename and edit the provided pseudocode file `filechecker.sh.pseudocode`
and substitute the lines `YOUR_CODE_HERE` with the code that 
accomplishes the requested task. To start, follow the instructions below.

### Prepare for the homework

1. Copy the homework directory to your 
   home directory on Aurora:

```console
cp -ar /projects/hep/fs10/mnxb01/tutorial3/homework3 ~
```

2. Access the directory where the pseudocode is:

```console
cd ~/homework3/code
```

3. Rename the pseudocode file:

```console
mv filechecker.sh.pseudocode filechecker.sh
```

4. Open the file with Pluma or the editor you fancy and read and write 
the code described in the tasks

```console
pluma filechecker.sh&
```

- To test your code, don't forget to make `filechecker.sh` executable:

```console
chmod +x filechecker.sh
```

While coding you may assume that the temporary file should be created 
in the current directory where the script is.
However, correction will be done on a different computer than Aurora,
so it is **mandatory** to use **relative paths** to reference such folder.
Read about relative paths in the manual and in Tutorial 2.
   
### How to progress 

The file `filechecker.sh.pseudocode` contains pseudocode written by the
teacher to help you progressing and increasing your knowledge of bash.
It consists of several tasks and their description.

You are requested to write code where the text says `YOUR_CODE_HERE`

**Delete** the text `YOUR_CODE_HERE` and start writing your own code
according to the exercise request. There is no limit in how much you 
write as long as it fulfils the requirements of the exercise.

You can do the exercises one by one and test the result against the
files in the `result/` folder (see folder structure below)

If you are annoyed by the error messages caused by lines that you did 
not yet edit, use the `#` symbol to comment out lines so that bash will 
ignore them as we've seen in the examples in Tutorial 3.

### Folder structure

the `tutorial3/homework3` structure is as follows:

```console
.
├── code  # contains code you have to modify
│   └── filechecker.sh.pseudocode # the pseudocode file you need to edit
├── README.md # this document
└── result # the example output for the exercise
    ├── output_noparam # The output the code should generate if the user forgets to add a parameter.
    │                          ./filechecker.sh
    ├── output_garbage # # The output the code should generate if the user runs the script with
    │                      ./filechecker.sh garbage
    │                        that is, a malformed URL (not an internet address)   
    └── output_www.hep.lu.se # The output the code should generate if the user runs the script with
                               ./filechecker.sh https://www.hep.lu.se/courses/MNXB01/index.html
                            
```

### Tracking your progress

In this homework the best way to track your progress is to use the debug mode
(see Tutorial 3 Slide 41) or use echo to printout the content of a certain variable 
to cross check that it contains what you expect.

If you do not want to run the whole script but you want it to stop at
any point, you can simply add an `exit 0` statement at the point you want the 
script to stop. Remember everything is executed from top to bottom of the script.

Check the folder `result/` to compare what the files you generate should look like.

The `output_*` files in `result/` show you what the program should print when 
called on selected inputs. Check the section Folder Structure above.

You can compare files using `diff` or `meld`. More about this is in a separate section below
and other information will come during the git tutorial.

#### Tips to check the script results

You can use the `diff` tool to compare the differences between the 
output of your script and the outputs in `result/`.

```console
diff fileA fileB
```

The `diff` tool prints out differences between a `fileA` and `fileB`,
and does not print the things the two files have in common.

Some info about diff here:

<https://www.computerhope.com/unix/udiff.htm>

For the homework, here's what you can do:

1) Save to file the output of your script:

```console
   ./filechecker.sh https://www.hep.lu.se/courses/MNXB01/index.html &> myoutput
```

2) Run diff 

```console
   diff myoutput ../result/output_www.hep.lu.se
```

Some outputs will differ by definition, for example, `wget` prints out
the date when it downloads things, and the tempfile name is different
everytime (that is the idea with the `mktemp` program you will be using).
That is ok, they will be different at every script run.

However, the lines about filetype should **NOT** differ, that means that `diff`
should not print them out.

If you want a graphical comparison tool, you can use `meld`.

## Grades

The `filechecker.sh.pseudocode` file contains a description of how the 
homework is graded. 

## Submission

Send your script on Canvas. If it doesn't accept the .sh extension,
create a tarball as described in Tutorial 2 and send the tarball instead.
