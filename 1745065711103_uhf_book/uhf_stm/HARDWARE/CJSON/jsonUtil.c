#include "jsonUtil.h"
#include "cJSON.h"
#include "stdio.h"
 cJSON		* root;
cJSON		* itemName;
extern temperatureLimit ;
extern		flameLimit ;
extern		gasLimit ;
extern		smokeLimit ;
extern char	cRes1[512]	;
extern char	cRes2[512];
extern int returnData;
void parseJson( char* p )
{
	root		= cJSON_Parse( p );
	itemName	= cJSON_GetObjectItem( root, "data" );
	if ( itemName )
	{
			
		
		returnData = itemName->valueint;
	
		
	}
	
	
	cJSON_Delete( root );
}

int strIntercept( char *pcBuf, char *start, char *end, char *pcRes )
{
	int pcBegin	= NULL;
	int  pcEnd		= NULL;

	pcBegin = strstr( pcBuf, start );
	/* printf( "pcBegin:%s \n", pcBegin ); */
	pcEnd = strstr( pcBuf, end );
	/* printf( "pcEnd:%s \n", pcEnd ); */
	if ( pcBegin == NULL || pcEnd == NULL || pcBegin > pcEnd )
	{
		printf( "Mail name not found!\n" );
	}else {
		/*	pcBegin += strlen(":"); */
		memcpy( pcRes, pcBegin + strlen( start ), pcEnd - pcBegin - strlen( start ) );
	}

	return(1);
}
