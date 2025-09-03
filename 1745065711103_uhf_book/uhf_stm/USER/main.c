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
/* 温度报警值 */
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
	DELAY_INIT();                                           /* 初始化时钟 延迟函数使用 */
	NVIC_PriorityGroupConfig( NVIC_PriorityGroup_2 );       /* 设置NVIC中断分组 */
	USART1_INIT( 115200 );                                  /* 串口1初始化 */
	USART2_INIT( 115200 );                                  /* 串口2初始化 */
	 

	printf( "wifi初始化成功" );
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

	printf( "系统初始化成功\n" );
 

	while ( 1 )
	{
		 
		
		
		sprintf( (char *) p, "GET http://192.168.43.58:9999/user/setStData?option=%d&war=%d", option,war);      
			
		printf("%s \r\n",p);
			//通过wifi将数据发送出去
	  u2_printf( "%s\r\n", p );
		
	 
		//1 失败 8成功   6余额不足 9未获取到结果
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


