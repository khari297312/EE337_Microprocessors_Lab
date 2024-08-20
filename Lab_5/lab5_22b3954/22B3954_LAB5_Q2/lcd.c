
//#include <iostream.h>
#include <at89c5131.h>
#include "lcd.h"
#include <math.h>

#define EULER_NUM 2.71828

code unsigned char display_msg1[]="     i/p 1     ";
code unsigned char display_msg2[]="     i/p 2     ";
code unsigned char display_msg3[]="   predict   ";
code unsigned char display_msg4[]="   class 1   ";
code unsigned char display_msg5[]="   class 2   ";

float w0 = -36;
float w1 = 5;
float w2 = 7;

float output;

float inp1 ;
float inp2 ;

float P_class1 = 0.0;
float P_class2 = 0.0;

sbit sw1=P1^0;	//Register select
sbit sw2=P1^1;	//Read from or write to register
sbit sw3=P1^2;	//Enable pin of lcd
sbit sw4=P1^3;

/*
float sigmoid(float n){
		return (1/(1 + exp(-n)));
}*/

int main(){
	
	lcd_init();
	
	/////////////////////////////////////INPUT 1
	P1 = 0x0F;																		//Ready to read
	lcd_cmd(0x80);
	lcd_write_string(display_msg1);								// Displaying on LCD
	msdelay(5000);																//Giving delay
	inp1 = P1;																		//Pulling Tray in
	
	/////////////////////////////////////INPUT 2
	P1 = 0x0F;																		//Ready to read
	lcd_cmd(0x80);
	lcd_write_string(display_msg2);								// Displaying on LCD
	msdelay(5000);																//Giving delay
	inp2 = P1;																		//Pulling Tray in
	
	/////////////////////////////////////Performing MAC
	output = w0*1;
	output = output + w1*inp1;
	output = output + w2*inp2;
	
	/////////////////////////////////////Using Sigmoid
	
	//P_class1 = 1/(1+ exp(-output))
	P_class1 = (float)(1.0/(1.0 + exp(-output)));
	P_class2 = 1.0 - P_class1;
	
	/////////////////////////////////////Multipltying
	
	lcd_cmd(0x80);													//Move cursor to 2nd line of LCD
	msdelay(4);
	lcd_write_string(display_msg4);
	//lcd_float(P_class1);
	
	lcd_cmd(0xC0);													//Move cursor to 2nd line of LCD
	msdelay(4);
	lcd_write_string(display_msg5);
	//lcd_float(P_class2);
	
	/////////////////////////////////////Checking for Class 1 or Class 2

	lcd_cmd(0x80);
	lcd_write_string(display_msg3);								// Displaying on LCD
	
	if(output < 0){
			lcd_cmd(0xC0);													//Move cursor to 2nd line of LCD
			msdelay(4);
			lcd_write_string(display_msg4);
	}
	else{
			lcd_cmd(0xC0);													//Move cursor to 2nd line of LCD
			msdelay(4);
			lcd_write_string(display_msg5);
	}

	while(1);
	return 0;
	
}
