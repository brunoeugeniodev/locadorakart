#include <stdio.h>

int main() {

    int num = 1, num1 = 1, rep, i;

    scanf("%d", &rep);

    int v[rep];

    for(i = 0 ; i < rep; i++){

        if( i <= 1){

            v[i] = 1;
        }else {

            v[i] =+ v[i - 1] + v[i - 2];
        }
    }

    for(i = rep - 1 ; i >= 0; i--){
        printf("%d ", v[i]);
    }
    printf("\n");
    return 0;
}

