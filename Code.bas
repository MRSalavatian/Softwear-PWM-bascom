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
Sh_cp Alias Portd.7                                         'Show
Ds Alias Portd.5                                            'Data
St_cp Alias Portd.6                                         'Clock

Config Sh_cp = Output
Config Ds = Output
Config St_cp = Output
'************************
Up Alias Pinc.0
Down Alias Pinc.1
Ok Alias Pinc.2
Printt Alias Pinc.3
Led Alias Portc.2

Config Up = Input
Config Down = Input
Config Ok = Input
Config Printt = Input
Config Led = Output

Config Portd = Output
'************************
Dim I As Word
Dim Ii As Word
Dim Count As Word
Dim Ops As Byte
Dim Flag As Byte

Dim Pwm(32) As Byte
Dim Outt(4) As Byte
Dim Pwm_counter As Byte

Const Max_pwm_count = 10
'************************
Stop Timer0

Do

   Incr Pwm_counter
   If Pwm_counter > Max_pwm_count Then Pwm_counter = 0

   Ii = 1
   For I = 0 To 7
      If Pwm(ii) > Pwm_counter Then Outt(1).i = 1 Else Outt(1).i = 0
      Incr Ii
   Next I

   For I = 0 To 7
      If Pwm(ii) > Pwm_counter Then Outt(2).i = 1 Else Outt(2).i = 0
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



   Incr Count
   If Count > 300 Then
      Count = 0
      For I = 1 To 32
         Pwm(i) = Ops
      Next I

      If Flag = 0 Then
         Incr Ops
         If Ops => Max_pwm_count Then Flag = 1
      End If

      If Flag = 1 Then
         Decr Ops
         If Ops = 0 Then Flag = 0
      End If

   End If






Loop
'************************
Shift_out:
   Led = 1
   Shiftout Ds , Sh_cp , Outt(1) , 1
   Shiftout Ds , Sh_cp , Outt(2) , 1
   Shiftout Ds , Sh_cp , Outt(3) , 1
   Shiftout Ds , Sh_cp , Outt(4) , 1
   St_cp = 0
   St_cp = 1
   Led = 0
Return
'************************
Tick:
Return
'************************


'(

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


Pwm(1) = 1
Pwm(2) = 9
Pwm(3) = 1
Pwm(4) = 9
Pwm(5) = 9
Pwm(6) = 9
Pwm(7) = 1
Pwm(8) = 1
Pwm(9) = 1
Pwm(10) = 9
Pwm(11) = 9
Pwm(12) = 5
Pwm(13) = 5
Pwm(14) = 5

')
