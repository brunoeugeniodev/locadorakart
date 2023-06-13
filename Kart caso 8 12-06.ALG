Algoritmo "Locadora de Kart"
// Projeto final : Locadora de Kart
// Professor: Gilberto V. Oliveira

Var
   modelo:vetor[0..14]de caractere
   valorLoc:vetor[0..14]de inteiro
   quantLoc:vetor[0..14] de inteiro
   locado:vetor[0..14] de inteiro
   naoLocado:vetor[0..14] de inteiro
   locacaoDeCircuito:vetor[1..1] de real
   quantidade:inteiro
   posi:vetor[0..14] de inteiro
Funcao menu:inteiro

Var
   res,opcao,retorno:inteiro
   resc:caractere
   resce:real
Inicio
   repita
      escreval
      escreval("1.  Cadastrar um Kart")
      escreval("2. Listar Karts disponíveis")
      escreval("3. Listar Karts locados")
      escreval("4. Alugar um Kart")
      escreval("5. Devolver um Kart")
      escreval("6. Kart que mais gerou ganhos")
      escreval("7. Receita e lucro do dia, considerando karts locados")
      escreval("8. Locação de circuito")
      escreval("9. Atualizar dia")
      escreval("10. Sair do programa")
      leia(opcao)
      escolha(opcao)
      caso 1
         res <- cadastro
      caso 2
         resc <- kartDis
      caso 3
         resc <- kartInd
      caso 4
         res <- aluguel
      caso 5
         res <- devolucao
      caso 6
         res <- ganhos
      caso 7
         resce <- receitaeLucro
      caso 8
         resce <- pista
      caso 9
         res <- atualiza
         caso10
         escreva("Sair do programa")
      fimescolha
   ate(opcao = 10)

Fimfuncao

Funcao cadastro:inteiro

Var
   i,aluguel,retorno:inteiro
Inicio
   escreval("O número máximo de karts que podem ser locados são 15.")

   repita
      escreval("Quantos karts voce quer cadastrar? ")
      leia(quantidade)
   ate (quantidade > 0) e (quantidade < 15)

   quantidade <- quantidade - 1

   para i de 0 ate quantidade passo 1 faca
      enquanto (modelo[i] = "") faca
         escreval("Qual o modelo do kart ", i+1 ," ?")
         leia(modelo[i])
      fimenquanto

      repita
         escreval("Qual o valor de locação?")
         leia(valorLoc[i])
      ate (valorLoc[i] > 0)

      repita
         escreval("Quantas vezes esse kart ja foi locado?")
         leia(quantLoc[i])
      ate (quantLoc[i] > -1)

      repita
         escreval("Este kart já está alugado? 1.Não 2.Sim")
         leia(locado[i])

         se(locado[i] = 1)entao
            locado[i] <- 1
            posi[i] <- i
         fimse
         se (locado[i] = 2) entao
            naoLocado[i] <- 2
         fimse
      ate (locado[i] = 1) ou (locado[i]= 2)

   fimpara

FimFuncao

Funcao kartDis:caractere

Var
   i:inteiro
   retorno:caractere
Inicio
   escreval("------------------------------------------------------------")
   escreval("")
   escreval("Lista de Karts disponiveis")
   escreval("")
   para i de 0 ate 14 passo 1 faca
      se(locado[i] = 1)entao
         escreval(i + 1," -Kart modelo: ",modelo[i],".")
         escreval("Valor de locação: ",valorLoc[i]," reais.")
         escreval("Já foi locado: ",quantLoc[i]," vezes.")
         escreval("----------------------------")
      senao
      fimse
   fimpara

Fimfuncao

Funcao kartInd:caractere

Var
   i:inteiro
   retorno:caractere
Inicio
   escreval("------------------------------------------------------------")
   escreval("")
   escreval("Lista de Karts locados")
   escreval("")
   para i de 0 ate 14 passo 1 faca
      se(naoLocado[i] = 2)entao
         escreval("----------------------------")
         escreval(i + 1,"-Kart modelo: ",modelo[i],".")
         escreval("----------------------------")
      fimse
   fimpara

Fimfuncao

Funcao aluguel:inteiro

Var
   numero,retorno,i:inteiro
Inicio
   escreval("------------------------------------------------------------")
   escreval("")
   repita
   enquanto (i = " ")  faca
      escreval("Escolha algum kart da lista de karts disponiveis")
      escreval(kartDis)
      leia(i)
   fimenquanto
   
      i <- i - 1
   ate (i = posi[i])


   se(locado[i] = 1) entao
      locado[i] <- 2
      naoLocado[i] <- 2
      quantLoc[i] <- quantLoc[i] + 1
      escreval("Parabéns você alugou este kart.")
   fimse

Fimfuncao

Funcao devolucao:inteiro

Var
   numero,retorno:inteiro
Inicio
   escreval("------------------------------------------------------------")
   escreval("")
   repita
      escreval("Qual o numero do kart que quer devolver?")
      escreval(kartInd)
      leia(i)
   ate (i < 15)
   se(naoLocado[i] = 2)entao
      naoLocado[i] <- 1
      locado[i] <- 1
      escreval("Seu kart foi devolvido com sucesso.")
   fimse

Fimfuncao

Funcao ganhos:inteiro

Var
   i, ganho, posicao:inteiro
Inicio
   ganho <- 0
   para i de 0 ate 14 faca
      se((quantLoc[i] * valorLoc[i]) > ganho)entao
         ganho <- quantLoc[i] * valorLoc[i]
         posicao <- i
      fimse
   fimpara
   escreval("------------------------------------------------------------")
   escreval("")
   escreval("O kart que gerou mais ganhos foi o kart foi o:")
   escreval("Modelo: ",modelo[posicao],".")
   escreval("Com o valor de: ",valorLoc[posicao]," reais.")
   escreval("Foi alugado: ",quantLoc[posicao]," vezes")
   escreval("Ele gerou ",ganho," reais de ganhos.")
Fimfuncao

Funcao receitaeLucro:real

Var
   i,multiplicacao:inteiro
   luc, total, Lcircuito, soma:real
Inicio
   Lcircuito <- locacaoDeCircuito[1] * 0,7
   multiplicacao <- 0
   total <- 0
   para i de 0 ate 14 faca
      se(locado[i] = 1)entao
         multiplicacao <- valorLoc[i] * quantLoc[i]
         total <- total + multiplicacao
      fimse
   fimpara
   luc <- (30 * total)
   luc <- luc / 100
   total<- total + Lcircuito
   escreval("O valor da receita é de:",total,"reais")
   escreval("")
   escreval("O lucro do dia foi de:",luc,"reais")
   retorne soma
Fimfuncao

Funcao pista: real
Var
vp,cc: inteiro
Inicio
//locacaoDeCircuito

escreval("Informe o valor da pista")
leia(vp)
escreval("Deseja alugar um circuito? 1-Sim/ 2-N�o")
leia(cc)
        se (cc < 1) ou (cc > 2) entao
             escreval("Digite uma opção válida")
        fimse
            se cc = 1 entao

                locacaoDeCircuito[1] <- 1

            fimse
            se cc = 2 entao
                locacaoDeCircuito[1] <- 0
           fimse
           se (locacaoDeCircuito[1] = 1) entao
               locacaoDeCircuito[1] <- vp
           fimse

        escreval("Lucro: ", locacaoDeCircuito[1])
Fimfuncao

Inicio
   escreval(menu)


Fimalgoritmo
