# Get-smart-on-Matlab
This program records my path of learning Matlab and I hope it will enlighten others.


Questions need to answer:
1. What is Matlab ?
2. How can I learn it efficiently ?
3. What is the best way to show my learning process from a rookie to a master ?


Answer:(with practice comes wisdom)
1. A kind of program language; 
2. Learn by teaching and sharing, I guess.
3. upload my progress to github!!!


Gold rules:
1. use 'help' or 'doc' command
2. write   'clear ; close all; clc'    every time at the beginning of a .m file to initialize.
3. faster! faster! faster!
      3.1 replace  loop with vectorization  so that the  program becomes neater and faster.
      3.2 preallocating any vectors or arrays in which output results are stored ,such as 'A = zeros(10);'
      
Problem Solving
1， personally defined functions cannot be used the same as that of system ones.For example, y = sin(x), it is ok wether the x
is a scalar or a vector,a scarlar x input results in a scarlar y output and so does a vector,but when it comes to your own function, it cannot tell difference between a vector and a scarlar,so if I want to get a vector output y, I have to use the 'for' loop to input the x one by one rather than input a vector x only once.



Some resource:
for getstart:
1.  free interactive tutotrial on official site : MATLAB onramp
       
                        which will show you 
                                  1. how to use it as a fundamental calculator.
                                  2. the operation,creation，comparison of vector and matrix
                                  3. save and load data; import data from files
                                  4. select data in a certain matrix
                                  5. how to get help from doc
                                  6. and so on, go to have a try.
2. offical  getstart.pdf, provide many examples for basic use.    http://uk.mathworks.com/help/pdf_doc/matlab/getstart.pdf        
