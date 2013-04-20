# SFU Course system auto filler

## Intro
This project is a collection of tools to reduce TA work for SFU(Simon Fraser University). 

I'm a TA for C language and SFU's course website doesn't support batch uploading student's scores and my remarks. So I write some script to do it for me. 

## Score_guide.rb
This is the ruby script that gives you a little hint when you are grading students' programs. To use it, you need to setup the right folder directory. Then, after you grade one student, his score and your remarks are all collected in a `txt` file in the following format:

    One line of score
    The rest remarks

For an example: 

    30.4
    Comments: 4
    Q1: check_perm: 4
    Q2: perm_score: 4
    Q3: print: 4
    Q4: make_perm: 4
    Q5: brute_force: 3 'largest_score' should be init to 0
    Q6: good scores: 3
    Q7: score output: 0.4
    Style: 4

This script can be run for many times. Student with a score text file will be ignored. I also use `subl` to read student's code, which is [Sublime Text 2](http://www.sublimetext.com/2)

## Score_filler.rb
This is the auto filler. Setup the directory of score texts before you use. Also alter `auto_fill_score.sh` so that it knows the right url for filling scores.

This script utilize a linux tool called `xdotool`. You may need to install it before using this script:

    sudo apt-get install xdotool

When running, this script will read score texts and fill them with *emulated* mouse and keyboard events. 

To make it easier, I use absolute positions to locate buttons and input fields, which means, you might need to modify these numbers and keep your brower stay at the same position. 