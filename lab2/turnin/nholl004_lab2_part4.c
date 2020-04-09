/*	Author: nholl004
 *  Partner(s) Name: 
 *	Lab Section:
 *	Assignment: Lab #  Exercise #
 *	Exercise Description: [optional - include for your own benefit]
 *
 *	I acknowledge all content contained herein, excluding template or example
 *	code, is my own original work.
 */
#include <avr/io.h>
#ifdef _SIMULATE_
#include "simAVRHeader.h"
#endif

int main(void) {
    /* Insert DDR and PORT initializations */
	DDRA = 0x00; PORTA = 0xFF;
	DDRB = 0x00; PORTB = 0xFF;
	DDRC = 0x00; PORTC = 0xFF;
	DDRD = 0xFF; PORTD = 0x00;
    /* Insert your solution below */
	unsigned char tmpa = 0x00;
	unsigned char tmpb = 0x00;
	unsigned char tmpc = 0x00; 
	unsigned char tmpd = 0x00; 
    while (1) {
	tmpa = PINA;
	tmpb = PINB;
	tmpc = PINC;
	
	if(((tmpa + tmpb + tmpc) < 0x8C)&& ((tmpa - tmpc) < 0x50 ) ){
		tmpd = (tmpa + tmpb + tmpc) >> 2;
		tmpd = tmpd <<2;
	}
	else if( ((tmpa + tmpb + tmpc) < 0x8C)&& ((tmpa - tmpc) > 0x50 )){
		tmpd = (tmpa + tmpb + tmpc) >> 2;
		tmpd = tmpd <<2; 
		tmpd = tmpd + 0x01;
	}
	else if(((tmpa + tmpb + tmpc) > 0x8C)&& ((tmpa - tmpc) < 0x50 )){
		tmpd = (tmpa + tmpb + tmpc) >> 2; 
		tmpd = tmpd <<2;
		tmpd = tmpd + 0x02;
	}
	else if(((tmpa + tmpb + tmpc) > 0x8C)&& ((tmpa - tmpc) > 0x50 )){
		tmpd = (tmpa + tmpb + tmpc) >> 2; 
		tmpd = tmpd <<2;
		tmpd = tmpd + 0x03;
	}
	

	PORTD = tmpd;	
    }
    return 1;
}
