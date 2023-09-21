$regfile = "m8def.dat"
$crystal = 8000000
'************************
$baud = 9600
Enable Interrupts
'************************
Config Timer0 = Timer , Prescale = 1024
On Timer0 Tick
Enable Timer0
Stop Timer0
'************************
Sh_cp Alias Portd.2
Ds Alias Portd.3
St_cp Alias Portd.4

Config Sh_cp = Output
Config Ds = Output
Config St_cp = Output
'************************
Up Alias Pinc.0
Down Alias Pinc.1
Ok Alias Pinc.2
Printt Alias Pinc.3

Config Up = Input
Config Down = Input
Config Ok = Input
Config Printt = Input

Config Portd = Output
'************************
Dim I As Word
Dim Ii As Word

Dim Pwm(32) As Byte
Dim Outt(4) As Byte
Dim Pwm_counter As Byte

Const Max_pwm_count = 10
'************************
Stop Timer0

I = 1

Pwm(1) = 1
Pwm(2) = 2
Pwm(3) = 3
Pwm(4) = 4
Pwm(5) = 5
Pwm(6) = 6
Pwm(7) = 7
Pwm(8) = 8
Pwm(9) = 9
Pwm(10) = 10
Pwm(11) = 1
Pwm(12) = 2
Pwm(13) = 3
Pwm(14) = 4
Pwm(15) = 5
Pwm(16) = 6
Pwm(17) = 7
Pwm(18) = 8

Do


   Incr Pwm_counter
   If Pwm_counter > Max_pwm_count Then Pwm_counter = 0

   Ii = 1
   For I = 0 To 7
      If Pwm(ii) <= Pwm_counter Then Outt(1).i = 1 Else Outt(1).i = 0
      Incr Ii
   Next I

   For I = 0 To 7
      If Pwm(ii) <= Pwm_counter Then Outt(2).i = 1 Else Outt(2).i = 0
      Incr Ii
   Next I

   For I = 0 To 7
      If Pwm(ii) <= Pwm_counter Then Outt(3).i = 1 Else Outt(3).i = 0
      Incr Ii
   Next I

   For I = 0 To 7
      If Pwm(ii) <= Pwm_counter Then Outt(4).i = 1 Else Outt(4).i = 0
      Incr Ii
   Next I

   Gosub Shift_out


   Waitms 10



Loop

Do

   If Up = 1 Then Incr Outt(1)
   If Down = 1 Then Decr Outt(1)
   If Ok = 1 Then Gosub Shift_out
   If Printt = 1 Then Print Bin(outt(1))

   Waitms 50

Loop
'************************
Shift_out:
Portd.7 = 1
   Shiftout Ds , Sh_cp , Outt(1) , 1
   Shiftout Ds , Sh_cp , Outt(2) , 1
   Shiftout Ds , Sh_cp , Outt(3) , 1
   Shiftout Ds , Sh_cp , Outt(4) , 1
   St_cp = 0
   St_cp = 1
   Portd.7 = 0
Return
'************************
Tick:

   If Pwm(1) = 10 Then
      Outt(1).0 = 1
      Pwm(1) = 0
   Else
      Outt(1).0 = 0
   End If






Return
'************************