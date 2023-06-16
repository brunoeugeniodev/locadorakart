Algoritmo "semnome"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi

Var
   modelo:vetor[0..14]de caractere
   valorLoc:vetor[0..14]de inteiro
   quantLoc:vetor[0..14] de inteiro
   locado:vetor[0..14] de inteiro
   naoLocado:vetor[0..14] de inteiro
   locacaoDeCircuito:vetor[1..1] de inteiro
   quantidade,i,cont,conttotal:inteiro
   posi:vetor[0..14] de inteiro

Funcao menu:inteiro
Var
   res,opcao,retorno:inteiro
   resc:caractere
   resce,resg:real
Inicio
   repita
      escreval
      escreval("1.Cadastrar um Kart")
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
         resg<- pista
      caso 9
         res <- atualiza
         caso10
         escreva("Sair do programa")
      fimescolha
   ate(opcao = 10)

Fimfuncao

Funcao cadastro:inteiro

Var
   aluguel,retorno:inteiro
Inicio
   escreval("O número máximo de karts que podem ser locados são 15.")
   escreval("")
   repita
      escreval("Quantos karts voce quer cadastrar? ")
      leia(quantidade)
   ate (quantidade > 0) e (quantidade < 15)

   repita
      enquanto (modelo[i] = "") faca
         escreval("Qual o modelo do kart ", i+1 ," ?")
         leia(modelo[i])
      fimenquanto

      repita
         escreval("Qual o valor de locação?")
         leia(valorLoc[i])
      ate (valorLoc[i] > 0)

      repita
         escreval("Este kart já está alugado? 1.Não 2.Sim")
         leia(locado[i])
         
         cont <- cont + 1
         conttotal <- conttotal + 1
         
         se(locado[i] = 1)entao
            locado[i] <- 1
            posi[i] <- i
         fimse
         se (locado[i] = 2) entao
            naoLocado[i] <- 2
            quantLoc[i] <- 1
         fimse
      ate (locado[i] = 1) ou (locado[i]= 2)
      i <- i + 1
   ate (cont = quantidade) ou (conttotal = 15)
   cont <- 0
   
FimFuncao

Funcao kartDis:caractere

Var
   retorno:caractere
Inicio

      escreval("------------------------------------------------------------")
      escreval("")
      escreval("Lista de Karts disponiveis")
      escreval("")
      para i de 0 ate 14 passo 1 faca
         se(locado[i] = 1)entao
            escreval(i + 1 ," -Kart modelo: ",modelo[i],".")
            escreval("Valor de locação: ",valorLoc[i]," reais.")
            escreval("Já foi locado: ",quantLoc[i]," vezes.")
            escreval("----------------------------")
         fimse
      fimpara


Fimfuncao

Funcao kartInd:caractere

Var
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

funcao verificacaoL(i:inteiro) : inteiro
var
   res:inteiro
inicio
   se (i < 0) entao
      res <- aluguel
   senao
      se (i > 14) entao
         res <- aluguel
      senao
         se (i <> posi[i]) entao
            res <- aluguel
         fimse
      fimse
   fimse
fimfuncao


Funcao aluguel:inteiro

Var
   res,retorno:inteiro
Inicio

      escreval("------------------------------------------------------------")
      escreval("")

      escreval("Escolha algum kart da lista de karts disponiveis")
      escreval(kartDis)
      leia(i)
      i <- i - 1
      res <- verificacaoL(i)

      se (locado[i] = 1) entao
         locado[i] <- 2
         naoLocado[i] <- 2
         quantLoc[i] <- quantLoc[i] + 1
         posi[i] <- -2
         escreval("Parabéns você alugou este kart.")
      fimse

Fimfuncao

funcao verificacaoD(i:inteiro) : inteiro
var
   res:inteiro
inicio
   se (i < 0) entao
      res <- devolucao
   senao
      se (i > 14) entao
         res <- devolucao
      senao
         se (posi[i] <> -2) entao
            res <- devolucao
         fimse
      fimse
   fimse
fimfuncao

Funcao devolucao:inteiro

Var
   res,numero,retorno:inteiro
Inicio
   escreval("")
   se (naoLocado[i] = 0) entao
      escreval("Não a karts locados para devolver!")
   senao
      escreval("------------------------------------------------------------")
      escreval("")
      escreval("Qual o numero do kart que quer devolver?")
      escreval(kartInd)
      leia(i)
      i <- i - 1
      res <- verificacaoD(i)
      se(naoLocado[i] = 2)entao
         naoLocado[i] <- 1
         locado[i] <- 1
         posi[i] <- i
         escreval("Seu kart foi devolvido com sucesso.")
      fimse
   fimse
Fimfuncao

Funcao ganhos:inteiro

Var
    ganho, posicao:inteiro
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
   multiplicacao:inteiro
   luc, total, Lcircuito, soma:real
Inicio
   Lcircuito <- locacaoDeCircuito[1]
   Lcircuito <- Lcircuito * 0.7
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
   escreval("O valor da receita são de:",total,"reais")
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
escreval("Deseja alugar um circuito? 1-Sim/ 2-Não")
leia(cc)
        se (cc < 1) ou (cc > 2) entao
             escreval("Digite uma opeção valida")
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