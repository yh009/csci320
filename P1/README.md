# Alarm clock
## Bucknell University 
## CSCI320 Project1
### Yuxuan Huang

### Test Instruction

Under the project folder do:

```
>make
>make demo
```
the output will be dumped into test.out

### Block Diagram
Here's the block diagram for the alarm clock:
![P1 diagram](./diagram/P1.png)

Here's the explaination for each module:
1. control module
    The control module helps to distinguish plus/minus signals for timer and alarm. It takes three 1 bit input(plus, minus, alarm) and output four 1 bit
    output(c_plus,c_minus,a_plus,a_minus). 

2. timer module
    The timer module handles incrementing/decrementing of clock time. It takes three 1 bit input(c_plus,c_minus,one_Hz), and output four 4 bit representation of the four clock
    digits(decimal value in binary form).

3. alarm module
    The alarm module handles incrementing/decrememting of alarm time. It takes two 1 bit input(a_plus,a_minus) and four 4 bit input from the timer module(which represent four clock
    digits).It output four 4 bit representation of the four alarm digits(decimal value in binary form) and a 1 bit alarm_on signal(which would be on after the first alarm button press)
    and a 1 bit is_equal signal(which would be on if alarm time equals clock time).

4. buzzer_control module
    The buzzer_control module decides when the buzzer should be on. It takes five 1 bit signal(off, alarm, alarm_on, is_equal,4kHz) and output a 1 bit buzzer signal, which would buzz at
    4kHz when the alarm is triggered. I designed a state machine for this module to work:
    ![state_machine diagram](./diagram/state_machine.png)
    With this state machine, i can be sure that the buzzer can be turned off when off button pressed. 

5. display module
    The display module handles the translation from 4 bit decimal value in binary form to 7 bit output to seven sigment display. It also decides when to display clock time and when to
    display alarm time. It takes four 4 bit time signal from timer module and 4 bit time signal from alarm module. It also takes a 1 bit alarm signal **(I forget to add the alarm signal
    into display module on the diagram)**. It output four 7 bit signal to seven sigment display.

6. One_Hz module
    This module takes 4kHz clock and turn it into 1Hz clock output.

### Testing
I did all the test in one run. Here is what i did for testing:
**(Note: both clock time and alarm time starts at 00:00 as default)**

    plus button pressed/released 2 times within the first 2 seconds.(00:02)

    minus button pressed/released 3 times within next 3 seconds. (23:59)

    plus button pressed/released 1 time within next second. (00:00)

    alarm button pressed 5 seconds later (00:00)

    plus button pressed/released 5 times within next 5 seconds. (alarm-00:05)

    minus button pressed/released 1 time next second. (alarm-00:04)

    alarm button released next second. (00:00)

    off button pressed/released 10 seconds later (00:00) (buzzer not on, this shouldn't do anything)

    buzzer should be triggerd at (00:04)

    off button pressed/released 220 seconds later (00:04) (buzzer should be turned off within(00:04))

    clock free increments till 5000 seconds.

    **(Note: i set the buzzer frequency to be 1Hz instead of 2kHz for testing convinenance)**

The testing result is in **test.out** file. 

According to the result, my alarm clock behavior matches requirement.




