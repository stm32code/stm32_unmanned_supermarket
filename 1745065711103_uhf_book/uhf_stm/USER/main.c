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
extern __IO u16 data_value[6];
u32		yw, hw1, hw2;
/* �¶ȱ���ֵ */
double	temperatureLimit;
int	flameLimit;
int	gasLimit;
int	smokeLimit;
u8	ds18b20_state;
int	i;

char	cRes[512]	= "";
char	cRes1[512]	= "";
char	cRes2[512]	= "";
int	showStr		= 0;
int returnData = -1;

void init( void )
{
	DELAY_INIT();                                           /* ��ʼ��ʱ�� �ӳٺ���ʹ�� */
	NVIC_PriorityGroupConfig( NVIC_PriorityGroup_2 );       /* ����NVIC�жϷ��� */
	USART1_INIT( 115200 );                                  /* ����1��ʼ�� */
	USART2_INIT( 115200 );                                  /* ����2��ʼ�� */
	 

	printf( "wifi��ʼ���ɹ�" );
}


int main( void )
{
	float	wd	= 0;
	int	num	= 0;
	int	showNum = 0;
	int war = 0;
	int option = 0;

	u8 p[100] = "";
	init();

	printf( "ϵͳ��ʼ���ɹ�\n" );
 

	while ( 1 )
	{
		 
		
		
		sprintf( (char *) p, "GET http://192.168.43.58:9999/user/setStData?option=%d&war=%d", option,war);      
			
		printf("%s \r\n",p);
			//ͨ��wifi�����ݷ��ͳ�ȥ
	  u2_printf( "%s\r\n", p );
		
	 
		//1 ʧ�� 8�ɹ�   6���� 9δ��ȡ�����
		if(returnData == 1 || returnData == 9){
			OLED_Fill( 0x00 );				
			OLED_ShowStr( 0, 2, "run...", 2 ); 
		}else if(returnData == 8){
			OLED_Fill( 0x00 );				
			OLED_ShowStr( 0, 2, "success...", 2 ); 
			
			GPIO_SetBits(GPIOB,GPIO_Pin_12);
			delay_ms( 1000 );
			delay_ms( 1000 );
			delay_ms( 1000 );
			GPIO_ResetBits(GPIOB,GPIO_Pin_12);
		}else if(returnData == 6){
			OLED_Fill( 0x00 );				
			OLED_ShowStr( 0, 2, "no balance...", 2 ); 
		}else if(returnData == 7){
			OLED_Fill( 0x00 );				
			OLED_ShowStr( 0, 2, "no card...", 2 ); 
		}else{
			OLED_Fill( 0x00 );				
			OLED_ShowStr( 0, 2, "run...", 2 ); 
		}
	  
		
		memset(USART2_RX_BUF,0,sizeof(USART2_RX_BUF)/sizeof(char));
		memset(cRes,0,sizeof(cRes)/sizeof(char));
		
		
		

 
	}
}


