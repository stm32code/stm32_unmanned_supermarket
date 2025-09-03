#include "delay.h"
#include "key.h"
#include "sys.h"
#include "usart.h"
#include "uart2.h"
#include "uart3.h"
#include "ds18b20.h"
#include "wifi.h"
#include "gpio.h"
#include "stdio.h"
#include "glr_adc.h"
#include "rc522.h"
#include "PWM.h"
extern __IO u16 data_value[6];
u32		AD1_value, hy, trq, yw, AD5_value;
//�¶ȱ���ֵ

u8		ds18b20_state;
int		i;

extern u8  USART3_RX_BUF[USART3_REC_LEN];
extern int codeFlag;




/**
 *   ����˵����
 *   1--SDA  <----->PA4
 *   2--SCK  <----->PA5
 *   3--MOSI <----->PA7
 *   4--MISO <----->PA6
 *   5--����
 *   6--GND <----->GND
 *   7--RST <----->PB0
 *   8--VCC <----->VCC
 **/


/* a9 a10 ��Ƭ���������  a2 a3 wifiʹ�� PB1 - ������  PB8-������ PB9-���� PC15-���� */

void init( void )
{
	
	DELAY_INIT(); //��ʼ��ʱ�� �ӳٺ���ʹ��
	NVIC_PriorityGroupConfig( NVIC_PriorityGroup_2 ); /* ����NVIC�жϷ��� */
	USART1_INIT( 115200 );//����1��ʼ�� 


}


int main( void )
{
	int num = 0;
	u8	p[100]		= "";
	  init();
	while(1){
			 
			delay_ms( 10 );
			num ++;
	}


}


