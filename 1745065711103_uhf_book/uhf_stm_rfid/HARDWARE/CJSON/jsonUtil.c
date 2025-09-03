#include "jsonUtil.h"
#include "cJSON.h"
#include "stdio.h"
 cJSON		* root;
cJSON		* itemName;
double temperatureLimit = 0;
int		flameLimit = 0;
int		gasLimit = 0;
int		smokeLimit = 0;

int  msg = 999;
int  g1 = 999;
int  g2 = 999;
int  g3 = 999;
int  g4 = 999;


void parseJson( char* p )
{
	root		= cJSON_Parse( p );
	//0-���� 1-����

//	printf("%s\n\r",p);
//				printf("\n\r ��ʼ�������¶� \n\r");
	itemName	= cJSON_GetObjectItem( root, "msg" );
	if ( itemName )
	{
			
		msg = itemName->valueint;
//		printf("\n\r �������¶� \n\r");
	
		
	}
//			printf("\n\r ��ʼ���������� \n\r");
	itemName = cJSON_GetObjectItem( root, "g1" );
	if ( itemName )
	{
//		printf("\n\r ���������� \n\r");
		g1 = itemName->valueint;
//		printf("\n\r ���������棺%d \n\r",itemName->valueint);
//			printf("\n\r ���������棺%d \n\r",flameLimit);
	}
	itemName = cJSON_GetObjectItem( root, "g2" );
	if ( itemName )
	{
		g2 = itemName->valueint;

	}
//				printf("\n\r ��ʼ���������� \n\r");
	itemName = cJSON_GetObjectItem( root, "g3" );
	if ( itemName )
	{
		
		g3 = itemName->valueint;
//		printf("\n\r ����������%d \n\r",smokeLimit);
	}
	//				printf("\n\r ��ʼ���������� \n\r");
	itemName = cJSON_GetObjectItem( root, "g4" );
	if ( itemName )
	{
		
		g4 = itemName->valueint;
//		printf("\n\r ����������%d \n\r",smokeLimit);
	}
	cJSON_Delete( root );
}

int strIntercept( char *pcBuf, char *start, char *end, char *pcRes )
{
	int pcBegin	= NULL;
	int  pcEnd		= NULL;

	pcBegin = strstr( pcBuf, start );
	printf("begin:%s",pcBegin);
	/* printf( "pcBegin:%s \n", pcBegin ); */
	pcEnd = strstr( pcBuf, end );
	printf("pcEnd:%s",pcEnd);
	/* printf( "pcEnd:%s \n", pcEnd ); */
	if ( pcBegin == NULL || pcEnd == NULL || pcBegin > pcEnd )
	{
		printf( "Mail name not found!\n" );
	}else {
		/*	pcBegin += strlen(":"); */
		memcpy( pcRes, pcBegin + strlen( start ), pcEnd - pcBegin - strlen( start ) );
		printf("pcEnd:%s",pcRes);
	}

	return(1);
}
