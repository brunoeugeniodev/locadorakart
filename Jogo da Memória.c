#include<stdio.h>
#include<stdlib.h>
#include<locale.h>
#include<conio.h>
int main()
{

	setlocale(LC_ALL,"Portuguese");
	
	int n=30, i[5], temp=0, acertou=0, errou=0, d, difi, repetir=0, continuar=1;

	
	srand(time(NULL));
	
	do{
	

	printf("***************Jogo da mémoria***************\n\n");
	
	
	
	
	printf("Em qual dificuldade deseja jogar?\n\n");
	printf("1-Fácil\n2-Médio\n3-Difícil\n\n");
	do{
		scanf("%d",&difi);
		printf("\nEssa dificuldade não existe, por favor tente de novo.\n\n");
	}while(difi!=1 && difi!=2 && difi!=3);
	switch(difi)
	{
		case 1:
			system("cls");
			printf("Memorize os números\n");
			sleep(2);
				for(n=0;n<5;n++)
		{
		temp = rand()%30;
		printf("\n%d",temp);	
		i[n]=temp;
		}	
		sleep(3);
		system("cls");
	
		printf("Quais números foram mostrados?\n\n");
	
		for(n=0;n<5;n++){
	
			scanf("%d",&d);
			if(d!=i[n]){
				errou++;
			}else{
				acertou++;
			}
		}
		
		if(acertou==0)
		{
			printf("\nVocê tem Amnésia?");
		}else{
			if(acertou==1)
			{
				printf("\nPelos menos lembrou de algo.");
			}else{
				if(acertou==2)
				{
					printf("\nOlha só, alguém está evoluindo.");
				}else{
					if(acertou==3)
					{
						printf("\nVamos lá você consegue.");
					}else{
						if(acertou==4)
						{
							printf("\nPor pouco, tente de novo.");
						}else{
							if(acertou==5)
							{
							printf("\nParabéns você completou a dificuldade Fácil.");
							}
						}
					}	
				}
			}
		}	
		printf("\n\nAqui estão os númmeros | %d | %d | %d | %d | %d |",i[0],i[1],i[2],i[3],i[4]);	
		
	break;
	
	case 2:
			system("cls");
			printf("Memorize os números\n");
			sleep(3);
				for(n=0;n<5;n++)
		{
		temp = rand()%50;
		printf("\n%d",temp);	
		i[n]=temp;
		}	
		sleep(2);
		system("cls");
	
		printf("Quais números foram mostrados?\n\n");
	
		for(n=0;n<5;n++){
	
			scanf("%d",&d);
			if(d!=i[n]){
				errou++;
			}else{
				acertou++;
			}
		}
		
		if(acertou==0)
		{
			printf("\nVocê tem Amnésia?");
		}else{
			if(acertou==1)
			{
				printf("\nPelos menos lembrou de algo.");
			}else{
				if(acertou==2)
				{
					printf("\nOlha só, alguém está evoluindo.");
				}else{
					if(acertou==3)
					{
						printf("\nVamos lá você consegue.");
					}else{
						if(acertou==4)
						{
							printf("\nPor pouco, tente de novo.");
						}else{
							if(acertou==5)
							{
							printf("\nParabéns você completou a dificuldade Médio.");
							}
						}
					}	
				}
			}
		}
		printf("\n\nAqui estão os númmeros | %d | %d | %d | %d | %d |",i[0],i[1],i[2],i[3],i[4]);
		break;
		
	case 3:
			system("cls");
			printf("Memorize os números\n");
			sleep(2);
	for(n=0;n<5;n++)
		{
		temp = rand()%99;
		printf("\n%d",temp);	
		i[n]=temp;
		}	
		sleep(1);
		system("cls");
	
		printf("Quais números foram mostrados?\n\n");
	
		for(n=0;n<5;n++){
	
			scanf("%d",&d);
			if(d!=i[n]){
				errou++;
			}else{
				acertou++;
			}
		}
		
		if(acertou==0)
		{
			printf("\nVocê tem Amnésia?");
		}else{
			if(acertou==1)
			{
				printf("\nPelos menos lembrou de algo.");
			}else{
				if(acertou==2)
				{
					printf("\nOlha só, alguém está evoluindo.");
				}else{
					if(acertou==3)
					{
						printf("\nVamos lá você consegue.");
					}else{
						if(acertou==4)
						{
							printf("\nPor pouco, tente de novo.");
						}else{
							if(acertou==5)
							{
							printf("\nParabéns você completou a dificuldade Difícil.");
							}
						}
					}	
				}
			}
		}
		
		printf("\n\nAqui estão os númmeros | %d | %d | %d | %d | %d |",i[0],i[1],i[2],i[3],i[4]);
		
		break;
	}
	

	do{
		printf("\n\nAperte 1 para continuar: ");
		scanf("%d",&continuar);		
	}while(continuar!=1);
	system("cls");
	}while(repetir<10);
}
