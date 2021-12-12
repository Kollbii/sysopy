#include <stdio.h>
#include <stdlib.h>

void statyczna(){
	int b;
    printf("Zatrzymanie statyczna() przed alokacją");
    scanf("%d", &b);

	double tablica[1000000];

    printf("Zatrzymanie statyczna() po alokacji");
	scanf("%d", &b);
	for (int i = 0 ; i < 1000000; i++){
		tablica[i] = 1;
	}

	printf("Zatrzymanie statyczna() po zapełnieniu 1");
	scanf("%d", &b);

}

void dynamiczna(){
	int a;
	printf("Zatrzymanie dynamiczna() przed alokacją");
	scanf("%d", &a);
	double *tablica;
	tablica = (double*)malloc(1000000*sizeof(double));
    printf("Zatrzymanie dynamiczna() po alokacji");
	scanf("%d", &a);
	for (int i =0 ; i <1000000; i++){
        tablica[i] = 1;
    }
    printf("Zatrzymanie dynamiczna() po zapełnieniu 1");
	scanf("%d", &a);

	free(tablica);
}

int main(void) {
	int a;
	int b;
	int c;

	printf("Wstrzymano działanie programu");
	scanf("%d",&c);	
	statyczna();
	printf("Koniec funkcji statyczna()");
	scanf("%d",&a);
	dynamiczna();
	printf("Koniec funkcji dynamiczna()");
	scanf("%d", &b);
}