//this is the c code on sdk

#include <stdio.h>
#include "platform.h"
#include "xparameters.h"
#include "xiomodule.h"
void print(char *str);


// a function to estimate square root it use guessing the result with ratio=0.5
float ss(float a)
{
	if(a>=1 && a<4)
		return 1.5;
	if(a>=4 && a<9)
			return 2.5;
	if(a>=9 && a<16)
				return 2.5;
	if(a>=16 && a<25)
			return 4.5;
	if(a>=225 && a<256)
				return 15.5;
	else return 0;
}
// a function to estimate cubic root it use guessing the result with ratio=0.5
float cc(float a)
{
	if(a>=1 && a<8)
		return 1.5;
	if(a>=8 && a<27)
			return 2.5;
	if(a>=27 && a<64)
				return 3.5;
	if(a>=64 && a<125)
			return 4.5;
	if(a<=-1 && a>-8)
			return -1.5;
		if(a<=-8 && a>-27)
				return -2.5;
		if(a<=-27 && a>-64)
					return -3.5;
		if(a<=-64 && a>-125)
				return -4.5;
	else return 0;
}
// calculateing sinus using furier series
float fusin(float x){
	return x-((x*x*x)/6)+((x*x*x*x*x)/120)+((x*x*x*x*x*x*x)/5040);
}
// calculateing cosinus using furier series
float fucos(float x){
	return 1-((x*x)/2)+((x*x*x*x)/24)-((x*x*x*x*x*x)/720);
}
// guessing the result of arcsinus
float arcsin(float a)
{
	if(a >= -1 && a <= -0.8)
		return -1.11977;
	if(a >= 0.7 && a <= 0.8)
			return 0.8;
	return 0;
}

int main()
{
    init_platform();
    //defineing IO ports
    XIOModule gpi1, gpi2, gpi3, gpi4;
    XIOModule gpo1, gpo2, gpo3, gpo4;
    //defineing variables
    float a, b, c, d;
    float delta, p, q;
    float x1, x2, x3;

    //initializeing Input ports in order to make it possible to read from
    XIOModule_Initialize(&gpi1, XPAR_IOMODULE_0_DEVICE_ID);
    XIOModule_Start(&gpi1);
    XIOModule_Initialize(&gpi2, XPAR_IOMODULE_0_DEVICE_ID);
    XIOModule_Start(&gpi2);
    XIOModule_Initialize(&gpi3, XPAR_IOMODULE_0_DEVICE_ID);
    XIOModule_Start(&gpi3);
    XIOModule_Initialize(&gpi4, XPAR_IOMODULE_0_DEVICE_ID);
    XIOModule_Start(&gpi4);
    //******************************************************************
    //initializeing Output ports in order to make it possible to write on
    XIOModule_Initialize(&gpo1, XPAR_IOMODULE_0_DEVICE_ID);
    XIOModule_Start(&gpo1);
    XIOModule_Initialize(&gpo2, XPAR_IOMODULE_0_DEVICE_ID);
    XIOModule_Start(&gpo2);
    XIOModule_Initialize(&gpo3, XPAR_IOMODULE_0_DEVICE_ID);
    XIOModule_Start(&gpo3);
    XIOModule_Initialize(&gpo4, XPAR_IOMODULE_0_DEVICE_ID);
    XIOModule_Start(&gpo4);
    //*******************************************************************
    while(1)
    {
    	// reading from input ports and put in float varibles
    	d =  XIOModule_DiscreteRead(&gpi1, 1);
    	a =  XIOModule_DiscreteRead(&gpi2, 2);
    	b =  XIOModule_DiscreteRead(&gpi3, 3);
    	c =  XIOModule_DiscreteRead(&gpi4, 4);
    	
    	// make the equation standard
    	a /= d;
    	b /= d;
    	c /= d;

    	// calculate p and q
    	p = b - ((a*a) / 3);
    	q =((2 * ((a*a*a) / 27)) - ((a * b) / 3)) + c;

    	// calculating delta
    	delta = ((q*q)/4) + ((p*p*p)/27);

    	// delta = 0 and it has one uniqe answer and two repeated answers
    	if(delta < 0.05 && delta > -0.05)
    	{
    		x1 = -2 * cc(q / 2) - (a / 3);
    		x2 = cc(q / 2) - (a / 3);
    		x3 = x2;
    	}
    	// delta > 0 and it has only one real answer
    	else if(delta > 0.05)
    	{
    		x1 = cc((((-1) * q) / 2) + ss(delta)) + cc((((-1) * q) / 2) - ss(delta)) - (a / 3);
    	}

    	// delta < 0 and it has three real answers
    	else if(delta < -0.05)
    	{

    		x1 = ((2 / ss(3)) * ss(-1 * p)) * fusin(arcsin((3 * ss(3) * q) / (2 * ss(-1 * p) * ss(-1 * p) * ss(-1 * p)  )) / 3) - (a / 3);
    		x2 = (-2 / ss(3)) * ss(-1 * p) * fusin((arcsin((3 * ss(3) * q) / (2 * ss(-1 * p) * ss(-1 * p) * ss(-1 * p) )) / 3) + (3.14 / 3)) - (a / 3);
    		x3 = (2 / ss(3)) * ss(-1 * p) * fucos((arcsin((3 * ss(3) * q) / (2 * ss(-1 * p) * ss(-1 * p) * ss(-1 * p) )) / 3) + (3.14 / 6)) - (a / 3);

    	}



    	// writing x1 , x2 , x3 and delta on output ports
    	XIOModule_DiscreteWrite(&gpo1, 1, x1);
    	XIOModule_DiscreteWrite(&gpo2, 2, x2);
    	XIOModule_DiscreteWrite(&gpo3, 3, x3 );
    	XIOModule_DiscreteWrite(&gpo4, 4, delta);

    }


    return 0;
}
