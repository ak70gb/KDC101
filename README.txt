This is a basic package to work with KDC101 for controlling PRM1/MZ8.
It controlls the motor through THORlabs .NET DLLs
//Quick Start
>>KDC101_init.m
move to the desired position 'x' by calling funtion
>>KDC101moveto(KDC101,x,timeout_val)
disconnect the motor by calling funtion 
>>KDC101disconnect(KDC101)
test can be done by running Mototest.m
//To move the motor
there are multiple ways to rotate the motor 
after calling KDC101_init, we create an object KDC101 . Let x be the value of the desired position
value in degree 
#1
>>KDC101moveto(KDC101,x,timeout_val) //where x is desired position value in degree 
#2
>>MoveTo(KDC101,x,timeout_val)
#3
>>KDC101.MoveTo(x,timeout_val) 
//to Know the current position
>>KDC101pos(KDC101)
//To goto Home(0degree)
>>KDC101home(KDC101,timeout_val)

