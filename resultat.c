#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
void main ()
{
pthread_t t_id0 ;
pthread_create(&t_id0,NULL,&source,NULL,);
pthread_join( t_id0,NULL);
pthread_t t_id1 ;
pthread_create(&t_id1,NULL,&seuillage,NULL,);
pthread_join( t_id1,NULL);
pthread_t t_id2 ;
pthread_create(&t_id2,NULL,&affichage,NULL,);
pthread_join( t_id2,NULL);

}

void source(INT_STREAM *out )
{
#pragma HLS INTERFACE axis port=out
out->write(150);

}

void seuillage(int seuil ,INT_STREAM *in INT_STREAM *out ,)
{
#pragma HLS INTERFACE axis port=in
#pragma HLS INTERFACE axis port=out



AXI_INT pixelOut,pixelIn;
in->read(pixelIn);
out->write(pixelOut);

}

void affichage(INT_STREAM *in )
{
#pragma HLS INTERFACE axis port=in


AXI_INT res;
in->read(res);

}

