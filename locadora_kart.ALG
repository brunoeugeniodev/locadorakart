Algoritmo "PROGRAMA DA EMPRESA STAR DEVELOPMENT "
// Disciplina   : [INTRODUÇÃO AOS ALGORITMOS]
// Professor   : Gilberto
// Descrição   :  Programa para uma locadora de kart
// Autores    : Bruno Eugênio Santos, Laila Leal, Lindomar Silva Júnior, Lucas Samuel Dias e Natalia Salete Rodrigues.
// Data atual  : 22/06/2023

// EMPRESA STAR DEVELOPMENT

Var
   modelo:vetor[0..14]de caractere
   valorLoc:vetor[0..14]de real
   quantLoc:vetor[0..14] de inteiro
   locado:vetor[0..14] de inteiro
   naoLocado:vetor[0..14] de inteiro
   locacaoDeCircuito:vetor[0..0] de real
   quantidade,i,conttotal,contador,res:inteiro
   posi:vetor[0..14] de inteiro
   vp:real


Funcao menu:inteiro
//Função emite o menu e busca todos os dados dentro dele.
Var
   res,opcao:inteiro
   resc:caractere
   resce:real
Inicio
   repita
      escreval("")
      escreval("      MENU LOCADORA: ")
      escreval
      escreval("1. Cadastrar um Kart")
      escreval("2. Listar Karts disponíveis")
      escreval("3. Listar Karts locados")
      escreval("4. Alugar um Kart")
      escreval("5. Devolver um Kart")
      escreval("6. Kart que mais gerou ganhos")
      escreval("7. Receita e lucro do dia, considerando Karts locados")
      escreval("8. Locação de circuito")
      escreval("9. Atualizar dia")
      escreval("10. Sair do programa")
      escreval("")
      escreval("Escolha o número correspondente à uma das opções listadas acima: ")
      escreval("")
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
      caso 10
         escreva("Finalizando o programa! Obrigado por utilizar um produto Star Development!")
      fimescolha
   ate(opcao = 10)

Fimfuncao

Funcao cadastro:inteiro
//Essa função fará o cadastro de todos os karts lendo: o modelo, valor de locação e status de locação do Kart.

Var
   aluguel, cont:inteiro
Inicio
   escreval("O número máximo de Karts que podem ser CADASTRADOS são 15.")
   escreval("")
   repita
      escreval("Quantos Karts você deseja cadastrar? ")
      leia(quantidade)
   ate (quantidade > 0) e (quantidade < 16)
   repita
      se(cont < quantidade) ou (conttotal < 15)entao
         enquanto (modelo[i] = "") faca
            escreval("Qual o modelo do Kart ", i+1 ," ?")
            leia(modelo[i])
         fimenquanto
         repita
            escreval("Qual o valor de locação?")
            leia(valorLoc[i])
         ate (valorLoc[i] > 0)
         repita
            escreval("Este Kart já está alugado?")
            escreval(" 1.Não")
            escreval(" 2.Sim")
            leia(locado[i])
         ate (locado[i] = 1) ou (locado[i]= 2)
         cont <- cont + 1
         conttotal <- conttotal + 1
         se(locado[i] = 1)entao
            locado[i] <- 1
            posi[i] <- i
         fimse
         se (locado[i] = 2) entao
            naoLocado[i] <- 2
            quantLoc[i] <- 1
            posi[i] <- -2
         fimse
         i <- i + 1

      senao
         escreval("")
         escreva("Quantidade máxima de Karts já cadastrados!")
      fimse
   ate (cont = quantidade) ou (conttotal = 15)

FimFuncao

Funcao kartDis:caractere
//Função para verificar quais karts estão disponíveis.
Var
   i:inteiro
   verifica:inteiro
Inicio

   para i de 0 ate (conttotal - 1) passo 1 faca
      se (locado[i] = 1) entao
         verifica <- 1
      fimse
   fimpara
   se (verifica = 1)entao
      escreval("------------------------------------------------------------")
      escreval("")
      escreval("Lista de Karts disponíveis: ")
      escreval("")
      para i de 0 ate 14 passo 1 faca
         se(locado[i] = 1)entao
            escreval(i + 1 ," -Kart modelo: ",modelo[i],".")
            escreval("Valor de locação: ",valorLoc[i]," reais.")
            escreval("Já foi locado: ",quantLoc[i]," vezes.")
            escreval("----------------------------")
         fimse
      fimpara
   senao
      escreval("")
      escreval("Não há Karts disponíveis!")
   fimse

Fimfuncao

Funcao kartInd:caractere
//Função para verificar quais karts estão indisponíveis.

Var
   i:inteiro
   verifica1 :inteiro
Inicio
   para i de 0 ate (conttotal - 1) passo 1 faca
      se (naolocado[i] = 2) entao
         verifica1 <- 1
      fimse
   fimpara
   se (verifica1 = 1)entao
      escreval("------------------------------------------------------------")
      escreval("")
      escreval("Lista de Karts locados: ")
      escreval("")
      para i de 0 ate 14 passo 1 faca
         se(naoLocado[i] = 2)entao
            escreval("----------------------------")
            escreval(i + 1,"-Kart modelo: ",modelo[i],".")
            escreval("----------------------------")
         fimse
      fimpara
   senao
      escreval("")
      escreval("Não há Karts locados!")
   fimse
Fimfuncao

procedimento verificacaoL(i:inteiro)
//Procedimento para verificar o valor de i na função de aluguel caso seja menor que 0, maior que 14 ou existente no vetor.
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
         senao
            se (i = posi[i]) entao
               se (locado[i] = 1) entao
                  locado[i] <- 2
                  naoLocado[i] <- 2
                  quantLoc[i] <- quantLoc[i] + 1
                  posi[i] <- -2
                  escreval("Parabéns! Você alugou o Kart modelo: ", modelo[i])
               fimse
            fimse
         fimse
      fimse
   fimse
fimprocedimento


Funcao aluguel:inteiro
//Função que chama e apresenta os karts disponíveis chamando a função kartDis permitindo ao usuário alugar algum dos karts.
Var
   i,verifica,res:inteiro
Inicio
   para i de 0 ate (conttotal - 1) passo 1 faca
      se (locado[i] = 1) entao
         verifica <- 1
      fimse
   fimpara
   se (verifica = 1) entao
      escreval("------------------------------------------------------------")
      escreval("")
      escreval("Escolha algum Kart da lista dos Karts disponíveis:")
      escreval("")
      escreval(kartDis)
      leia(i)
      i <- i - 1
      verificacaoL(i)
   senao
      escreval("")
      escreval("Não há Karts disponíveis para alugar!")
      escreval("")
   fimse
Fimfuncao

procedimento verificacaoD(i:inteiro)
//Procedimento verifica o valor de i na função de devolução caso seja menor que 0, maior que 14 ou existente no vetor.
var
   res:inteiro
inicio
   se (i < 0) entao
      res <- devolucao
   senao
      se (i > 14) entao
         res <- devolucao
      senao
         se (naoLocado[i] <> 2) entao
            res <- devolucao
         senao
            se (naoLocado[i] = 2) entao
               naoLocado[i] <- 1
               locado[i] <- 1
               posi[i] <- i
               escreval("O Kart modelo: ", modelo[i], " foi devolvido com sucesso.")
               escreval("")
               escreval("------------------------------------------------------------")
               escreval("")
            fimse
         fimse
      fimse
   fimse
fimprocedimento

funcao devolucao: inteiro
//Função que recebe a função karts indisponíveis ou seja alugados fazendo com que o usuário selecione algum dos karts para devolver.

Var
   i,verifica1, res:inteiro
Inicio
   para i de 0 ate (conttotal - 1) passo 1 faca
      se (naolocado[i] = 2) entao
         verifica1 <- 1
      fimse
   fimpara
   se (verifica1 = 1)entao
      escreval("")
      escreval("------------------------------------------------------------")
      escreval("")
      escreval("Qual o número do Kart que deseja devolver?")
      escreval(kartInd)
      leia(i)
      i <- i - 1
      verificacaoD(i)
   senao
      escreval("")
      escreval("Não há Karts indisponíveis para devolver!")
      escreval("")
   fimse
fimfuncao

Funcao ganhos:inteiro
//A função ganhos mostra o modelo, valor, quantidade e ganho que o kart mais lucrativo gerou.
Var
   i, posicao,verifica:inteiro
   ganho:real
Inicio
   para i de 0 ate (conttotal - 1) passo 1 faca
      se (quantLoc[i] <> 0 ) entao
         verifica <- 1
      fimse
   fimpara
   se (verifica = 1) entao
      ganho <- 0
      para i de 0 ate 14 faca
         se((quantLoc[i] * valorLoc[i]) * 0.3 > ganho)entao
            ganho <- (quantLoc[i] * valorLoc[i]) * 0.3
            posicao <- i
         fimse
      fimpara
      escreval("------------------------------------------------------------")
      escreval("")
      escreval("O Kart que gerou mais ganhos foi o :")
      escreval("")
      escreval("Modelo: ",modelo[posicao],".")
      escreval("Com o valor de: ",valorLoc[posicao]," reais.")
      escreval("Foi alugado: ",quantLoc[posicao]," vezes.")
      escreval("Ele gerou ",ganho," reais de ganhos.")
      escreval("------------------------------------------------------------")
      escreval("")
   senao
      escreval("No momento nenhum Kart gerou ganhos!")
   fimse
Fimfuncao

Funcao receitaeLucro:real
//Função que exibe a receita e o lucro tanto dos karts quanto do circuito.
Var
   i:inteiro
   multiplicacao,luc, total, Lcircuito, Rcircuito, soma:real
Inicio
   Rcircuito <- ((contador * vp) * 0.7)
   Lcircuito <-((contador * vp) * 0.3)
   multiplicacao <- 0
   total <- 0
   para i de 0 ate 14 faca
      multiplicacao <- valorLoc[i] * quantLoc[i]
      total <- total + multiplicacao
   fimpara
   luc <- total * 0.3
   luc <- luc + Lcircuito
   total <- total + Rcircuito
   se (total = 0)entao
      escreval("------------------------------------------------------------")
      escreval("")
      escreval("No momento o dia não gerou receita e nem lucro! ")
   senao
      escreval("------------------------------------------------------------")
      escreval("")
      escreval("O valor da receita é de:",total," reais.")
      escreval("")
      escreval("O lucro do dia é de:",luc," reais.")
      escreval("")
      escreval("------------------------------------------------------------")
   fimse
Fimfuncao

Funcao pista: real
//Função que pergunta ao usuário se ele quer ou não locar o circuito.
Var
   esc,cc: inteiro

Inicio
   //locacaoDeCircuito
   se (vp <> 0) entao
      escreval("------------------------------------------------------------")
      escreval("")
      escreval("CIRCUITO JÁ CADASTRADO!")
      escreval("")
   senao
      repita
         escreval("------------------------------------------------------------")
         escreval("")
         escreval("Por favor, informe o valor da pista:")
         leia(vp)
      ate (vp <> 0)
   fimse
   se (locacaoDeCircuito[0] = 1) entao
      repita
         escreval("O circuito já está locado, desejá deslocar?")
         escreval("1-Não")
         escreval("2-Sim")
         leia(esc)
      ate (esc = 1) ou (esc = 2)
      se (esc = 1) entao
         escreval("------------------------------------------------------------")
         escreval("")
         escreval("O circuito continua locado.")
         escreval("------------------------------------------------------------")
      senao
         locacaoDeCircuito[0] <- 0
         escreval("------------------------------------------------------------")
         escreval("")
         escreval("O circuito foi devolvido.")
         escreval("------------------------------------------------------------")
      fimse
   senao
      repita
         escreval("Deseja alugar o circuito? ")
         escreval(" 1-Não")
         escreval(" 2-Sim")
         leia(cc)
      ate (cc = 1) ou (cc = 2)

      se cc = 2 entao
         locacaoDeCircuito[0] <- 1
         contador <- contador + 1
         escreval("O circuito foi locado com sucesso!")
         escreval("------------------------------------------------------------")
      fimse
      se cc = 1 entao
         locacaoDeCircuito[0] <- 0
         escreval("Circuito não locado.")
         escreval("------------------------------------------------------------")
      fimse

   fimse
Fimfuncao

funcao atualiza:inteiro
//Função que atualiza os dados dos dias e cobra os karts que o usuário deseja que permaneçam locados.
Var
   i,continua,verifica1,resposta,res,opc:inteiro
Inicio
   limpatela
   se (locacaoDeCircuito[0] = 1) entao
      repita
         escreval("Deseja deslocar o circuito? Caso queira atualizar o dia com o circuito deslocado. ")
         escreval("1-Sim")
         escreval("2-Não")
         leia(opc)
      ate (opc = 1) ou (opc = 2)
      se (opc = 1) entao
         locacaoDeCircuito[0] <- 0
         contador <- 0
      senao
         locacaoDeCircuito[0] = 1
         contador <- 0
      fimse
   senao
      contador <- 0
   fimse

   para i de 0 ate (conttotal - 1) passo 1 faca
      se (naolocado[i] = 2) entao
         verifica1 <- 1
      fimse
   fimpara
   se (verifica1 = 1) entao
      repita
         escreval("Deseja manter todos os Karts que estão locados ?")
         escreval(" 1-Não")
         escreval(" 2-Sim")
         leia(resposta)
      ate (resposta = 1) ou (resposta = 2)
      se(resposta = 1) entao
         res <- devolucao
         repita
            repita
               escreval("Deseja continuar selecionando Karts para devolução ?")
               escreval(" 1-Não")
               escreval(" 2-Sim")
               leia(continua)
            ate (continua = 1) ou  (continua = 2)
            se(continua = 2) entao
               res <- devolucao
            fimse
         ate(continua = 1)
      fimse
      para i de 0 ate 14 passo 1 faca
         se(naoLocado[i] = 2)entao
            naoLocado[i] <- 2
            posi[i] <- -2
            quantLoc[i] <- 0
         fimse
      fimpara
   fimse
   para i de 0 ate 14 passo 1 faca
      se (naoLocado[i] = 1) entao
         quantLoc[i] <-  0
      fimse
   fimpara
   escreval("O dia foi atualizado com sucesso!")
Fimfuncao

Inicio

   res <- menu

Fimalgoritmo
