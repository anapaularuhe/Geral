*********************************************
************** TUTORIAL STATA ***************
*********************************************

*** PREPARAÇÃO
* Memória:
clear all								
set memory 10g
set matsize 11000
set maxvar 30000

	* clear all limpa a memória, eliminando variáveis que podiam estar abertas
	* set memory fixa a quantidade de memória que o stata pode usar para armazenar variáveis. Ajustamos para cima
	* set matsize fixa a quantidade máxima de variáveis que podem ser usadas para estimação. Ajustamos para cima. Default = 400, max = 11.000
	* set maxvar fixa a quantidade máxima de variáveis que podem ser armazenadas
	
	* query memory reporta as configurações atuais a respeito da memória. 
	*** Stata informa que esses comandos não são mais necessários nas versões modernas. 
	
* Limpando result window:	
cls
	
* Diretório: 
cd "C:/Users/ana.ruhe/Documents/..."
global dirpath = "C:/Users/ana.ruhe/Documents/..."
global dirdata = "C:/Users/ana.ruhe/Documents/.../Dados"

	* cd "Change Directory": define a pasta para o diretório
	* global dirpath  cria o endereço "dirpath". Acessamos bases/variáveis via "dirpath\Nome_do_arquivo.csv"
	* globar dirdata  cria o endereço "dirdata". Acessamos "" . A vantagem é poder usar uma pasta separada para os dados e os outputs.
	
	
* Log:
log using "$dirpath/logfilename.log" , replace
log close

	* Cria/usa e sobrescreve o arquivo logfilename.log. Serve para salvar o histórico do prompt de comando e os outputs gerados.
	* Replace faz com que o arquivo pré-existente seja sobrescrito. Para criar novo log, tem que ter nome diferente. 
	* log using abre, log close fecha - Será salvo o que foi feito entre os dois comandos.
	

* Comentários: * ou //
  /*
  Cria comentários multilinha.
  */
  

  
*********************************************
*** FUNÇÕES
* Comandos lógicos
/*
	<  Menor que 
	<= Menor ou igual
	>  Maior que
	>= Maior ou igual
	== Igual a
	~= Diferente de
	!= Diferente de
	~  Não
	&  E and
	|  Ou or
	!. Diferente de "missing"
*/


* Funções algébricas:
/*   
   abs()   Valor absoluto                
   int()   Função inteiro
   min()   Mínimo
   max()   Máximo
   sum()   Soma dos elementos 
   sqrt()  Raiz quadrada
   exp()   Exponencial
   ln()    Logaritmo natural
   log()   Logaritmo base 10
 */
 
 
* Variáveis aleatórias:
/*
   normal()   distribuição acumulada da normal
   rnormal()  gerar numero aleatório normal -> Ver documentação: help rnormal - indica funções para todas distribuições 
   set seed() para tornar geração de números aleatórios replicável
*/
 
 
 
*********************************************
*** MANIPULAÇÃO DE DADOS  
* sum or summarize    Estatísticas descritivas (obs: sum(x) é a soma, sum x é summarize); 
  /* Pode ser combinada com condição lógica. Ex:
     sum X if Y == 1  
  */ 

* tab                 Resumo das características da variável
* collapse 			  Converts the dataset in memory into a dataset of means, sums, medians, etc (Default é mean). Input must refer to numeric variables exclusively.
  * Ex: collapse (sum) x (sum) y [pesos = w]     
  * Retorna valores sum(x) e sum(y) ponderados pelos pesos w
  * Obs: como trabalha com o dataset, é necessário usar preserve/restore para não perder a base 

* gen				  Cria uma variável a partir de expressão ou condição lógica: gen VARIAVEL = EXPRESSAO
* replace             Modifica uma variável existente: replace VARIAVEL = NOVAEXPRESSAO

* drop                Elimina variáveis que atendem a condição lógica: drop if CONDICAO
* keep                Mantém variáveis que atendem a condição lógica

* append              Junta bases com as mesmas colunas (empilha as linhas)
* merge               Junta variáveis (colunas) de bases diferentes 

* label               Cria label para a variável: label variable VARIAVEL "Label"
* rename              Renomeia variável: rename VARIAVEL NOMENOVO  
  * Ex: rename V2007 sexo
  *     label define genero 1 "homem" 2 "mulher" 
  *	    label values sexo genero

* preserve            Chamamos para fazer modificações em uma base intermediária de dados, preservando a base original
* restore             Retomando a base original

* save                Salvar base: save "nome.dta", replace
* export excel        Salvar base em xlsx
 

*********************************************
*** PACOTES
* Instalando: ssc install NOMEDOPACOTE

* reghdfe     Regressão com efeitos fixos
* tabout      Gráficos

 