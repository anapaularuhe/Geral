# BIBLIOTECA DE FUNÇÕES E COMANDOS NO R
# Ana Paula Nothen Ruhe


# 1. GERAL --------------------------------------
  # Diretório: pasta onde os arquivos são salvos e abertos
    getwd()                    # Informa o diretório atual 
    setwd("C:/...")            # Altera o diretório para o endereço informado
  
  # Environment: espaço onde os objetos são armazenados
    ls()                       # Lista de todos os objetos no Environment
    rm()                       # Remove do environment o objeto indicado
    rm(list = ls())            # Limpa o environment
    
  # Configuração de exibição de casas decimais e notação científica  
    options(scipen = 100, digits = n)    
    # scipen indica quantas casas guardar em decimais (evitando notação científica)
    # digits indica quanto dígitos exibir
    
  # Instalação de pacotes:
    install.packages("nome")   
    library(nome)              # O pacote tem que ser lido cada vez que o R é aberto
    
  # Ajuda e documentação: duas formas são equivalentes
    help(função) 
    ?função
    
    str()                      # Descreve a estrutura de um objeto. Por ex: mostra os argumentos da função   
    
  # Programação eficiente:
    magrittr                   # Pacote com o operador "forward-pipe" %>% , que pode ser lido como "e então". Mais info: https://uc-r.github.io/pipe
    alt -                      # Comando que gera o assingment symbol <-  
    
  # Diversos:  
    class()                    # Indica a classe de um objeto
    length()                   # Indica o tamanho de um vetor
    print(x, digits = y)       # Printa a variável x no console arredondando para y casas decimais
    numeric(n)                 # Cria vetor de 0 de tamanho n da classe numeric
    vector()                   # Cria um vetor vazio; argumento "mode" determina a classe. Ex: vector(mode = "numeric") cria apenas o espaço na memória (pode transformar em vetor numérico de qualquer tamanho).
                               ## Pode criar listas também: vector(mode = "list").
    list()                     # Transforma em lista os objetos dentro do ()
    paste()                    # Concatenate strings   
   
  
  # Comandos lógicos:
    !    não
    
 
  # Importar e exportar dados
    # Pacotes:  
      readxl                   # Ler arquivos de excel
      writexl                  # Salvar arquivos em excel
      readr                    # Pacote com funções otimizadas
    
    # Funções:
      read.csv("C:/...")
      write.csv() 
      read_excel("C:/...")     (readxl)
      write_xlsx()             (writexl)
      read.table               # Função para importação de dados. Ver parâmetros no help. Informar colClasses torna processo muito mais rápido.
      
      read_csv                 (readr)    # Funções otimizadas. Muito mais rápidas na importação dos dados! 
      read_table               (readr)    # ""

      readLines(..., n)        # Ler apenas primeiras n linhas 
      
      
  # Latex:
    latex2exp                  # Pacote que permite escrever em latex
    Tex()                      # Função para escrever em Latex
    
    

# * 1.1 Debugging -------------------------------
    traceback()                # Deve ser chamada imediatamente após receber um erro. Indica em que nível da função o erro ocorreu.
    debug(f)                   # Toda vez que a função f for chamada, abre o browser do debug
    undebug(f)                 # Desliga o gatilho de debug da função f
    # Comandos no browser:
     # n: executa a expressão atual e move para a próxima
     # c: executa a função inteira até o final ou até um erro
     # Q: fecha o browser
    
    options(error = recover)   # Quando ocorre um erro, em vez de fechar a função, abre opções de browser.
    

# * 1.2 Profiling  ------------------------------
# "Profiling is a systematic way to examine how much time is spent in different parts of a program.
    system.time({})            # Retorna quanto tempo a expressão nos {} levou para processar
     # User time x system time (podem ser diferentes quando há paralelização)
    
    Rprof()                    # Liga o profiler. Passa a "contar o tempo"
    Rprof(NULL)                # Desliga o profiler. Retorna produto bruto do que foi feito enquanto estava ligado.
    summaryRprof()             # Tabula e "traduz" o tempo medido pelo profiler.
        

# 2. MANIPULAÇÃO DE DADOS -----------------------
# * 2.1 Pacotes ---------------------------------
      tidyverse                # Conjunto de pacotes para data science
      dplyr                    # Manipular dados
      stats                    # Lidar com séries de tempo
      tseries                  # " "
      lubridate                # Lidar com datas
      stringi                  # Lidar com strings ("plural" de character)
      boot                     # Simulação com bootstrap
 
      
      
# * 2.2 Funções ----------------------------------
  # Criar data frames:
    data.frame()               # Criar dataframe a partir dos inputs
    - data.frame(nome1 = v1, nome2 = v2, row.names = vetordenomes)
    - Para acrescentar uma nova coluna "y": df$y = dadosy
    - Para excluir uma coluna "y": df$y = NULL
    as.data.frame()            # Transforma conjunto de dados em dataframe
    
  # Concatenação:
    c()                        # Concatenar (juntar variáveis em vetor)
    rbind()                    # Junta vetores/matrizes/df empilhando as linhas
    cbind()                    # Junta vetores/matrizes/df empilhando as colunas
    fix()                      # Permite corrigir os valores em um dataframe
    duplicated()               # Identifica dados com a característica citada duplicada
      
    
  # Pacote dplyr:
    select()                   # Seleciona um subconjunto das COLUNAS de um dataframe
    filter()                   # Seleciona um subconjunto das LINHAS de um dataframe, filtrando por determinada característica (condição lógica)   
    arrange()                  # Reordena as linha
    rename()                   # Muda o nome das variáveis
    mutate()                   # Adiciona novas variáveis (colunas) ou transforma variáveis existentes
    summarize()                # Gera um resumo de estatísticas descritivas das variáveis no dataframe
    
   
  # Subconjuntos de dados:
    split(x,factor)            # Divide o df x em grupos determinados por factor
    gl(n,k)                    # Função generate levels: cria fator que divide em n grupos de k elementos 

    # Ex: split(x,gl(n,k)) divide o df x em n grupos de k elementos. 
    # Ex2: Split pode usar categoria já existente do df: split(DF, DF$month) 
    # Ex3: lapply(split(x,factor),f) : aplica a função f aos subgrupos de x gerados pelo factor (que pode ser gerado por gl) 
        
    quantile()                 # Divide o array ou df em quantis, informando os % desejados   
    subset()                   # Retorna um subconjunto do df/array que satisfaz uma condição lógica. Para df, retorna LINHAS.
    unique()                   # Remove elementos repetidos   
        
     
  # Funções para nomear objetos:   
    # Data frame:  
      names()                  # Atribui um nome y a um objeto x: names(x) = y
      names()[i]               # Atribui nome ao objeto i de um dataframe
      rename()                 # Muda o nome das variáveis
      row.names                # Dá nome as linhas
    # Matriz:
      colnames()
      rownames()      
      
    make.names()               # Converte um vetor character em uma lista de nomes sintaticamente válidos para as variáveis (tira espaços e outros símbolos não suportados) 
      
      
# * 2.3 Estatísticas descritivas ----------------
  skimr                        # Pacote    
  skimr::skim_to_wide()        # Função - Retorna um data frame com um resumo das informações de forma visualmente organizada
  
  summary()                    # Semelhante a str()
  summarize()                  # Gera um resumo de estatísticas descritivas das variáveis
  
  
  
# * 2.4 Datas e Tempo ---------------------------
  # Data: classe DATE
  # Tempo: classes POSIXct e POIXlt
  
  # Funções para conversão:
    strptime()                 # Função para converter Time <=> Character 
    as.Date()
    as.POSIXct()
    as.POSIXlt()
  
    
# * 2.5 Character e Strings  --------------------
    strsplit()                 # Divide string conforme o separador informado
    paste()                    # Junta strings conforme o separador informado
    stri_sub()      (stringi)  # Substitui ou acrescenta characters em uma string
    
    

    
        
# 3. MACHINE LEARNING ---------------------------     
# * 3.1 Pacotes ---------------------------------
  caret
  tidymodels    
      
    
    
# 4. FUNÇÕES ------------------------------------
# * 4.1 Matrizes --------------------------------
  t()                          # Transposta
  diag()                       # diag(A) = vetor das entradas da diagonal principal; diag(x) = retorna matriz diagonal com elementos de x
  solve()                      # Inversa (função que resolve sistemas de equações)
  det()                        # Determinante
  dim()                        # Nº dimensões
  nrow()
  ncol()
  matrix(dados,nrow,ncol)      # Cria uma matriz
  
  # Operações: 
    A*B                        # Multiplicação point-wise
    A/B                        # Divisão point-wise
    A%*%B                      # Multiplicação de matrizes
    colSums()                  # Soma dos valores nas colunas
    rowSums()                  # Soma dos valores nas linhas
    colMeans()                 # Média das colunas
    rowMeans()                 # Média das linhas
      
    

# *4.2 Otimização -------------------------------
  optimize()                   # Geral, 1 dimensão
  optim()                      # Geral, n dimensões
  lp()        (lpSolve)        # Programação linear (objetivo e restrições lineares)
  solve.QP    (quadprog)       # Programação quadrática (objetivo quadrática, restrições lineares)
  optimize    (optimize)       # Programação não-linear
  optimx      (optimx)         # Programação não-linear
  # Mais detalhes: https://cran.r-project.org/web/views/Optimization.html 
  #                https://www.is.uni-freiburg.de/resources/computational-economics/5_OptimizationR.pdf


  
# * 4.3 Variáveis aleatórias --------------------
  # Grupos de funções de variáveis aleatórias:
    # r: random number generator
    # d: density function 
    # p: cumulative function
    # q: quantile function (inverse cumulative function): valor crítico tabelado
  
  runif()                      # Gerar V.A. a partir da distribuição uniforme
  rnorm()                      # Gerar V.A. a partir da distribuição normal  
  rbinom()                     # Gerar V.A. a partir da distribuição binomial
  rpois()                      # Gerar V.A. a partir da distribuição Poisson
  
  # Simulação: gerando números aleatórios replicáveis
  set.seed()
  
  sample(x,n)                  # Sorteia n elementos de x. Permutação: não informar n. Argumento: replace (TRUE or FALSE).    

    
# * 4.4 Loops -----------------------------------
  seq_along()                  # seq_along(x) gera a sequência de inteiros 1:length(x). Para X matriz: seq_along(nrow(X))
  lapply(x, f, ...)            # Loop que aplica a função f nos elementos da lista x; Output sempre é uma lista. x é usado como primeiro argumento de f, outros argumentos podem ser informados nos ...  
  sapply(x, f, ...)            # Como lapply, mas simplifica o output (ex: se x é vetor, retorna vetor f(x) e não lista)
  tapply(x, index, f, ...)     # Exclusiva para vetores: aplica a função f a subgrupos de x definidos pelo fator index; equivalente a combinação de loop + split      
  apply(x, margin, f, ...)     # Avalia a função f em uma dimensão (margin) do array x. Ex: aplicar função nas linhas (margin = 1) de uma matriz 
                                 # Caso geral das funções rowSums/colSums e rowMeans/colMeans
  mapply(f,x,y)                # Loop multivariado: aplica a função f, passando a lista x como primeiro argumento e a lista y como segundo argumento. Resulta: f(x1,y1), f(x2,y2), ...
                              
  
  
     
# 5. ALGUNS EXEMPLOS ----------------------------
### Editando o formato de data de um dataframe: coluna "date" veio no formato "yyyymm"    
    date <- as.character(df$date)              # Transforma em character
    
    for(i in 1:(length(date))){
      stri_sub(date[i],5,4) <- "-"             # Insere o character "-" na posição 5, sem excluir nenhum character pré-existente
    }                                          # Resultado: data no formato "yyyy-mm", ou Ym. Mas esse formato não é suportado, precisamos do dia
      
    for(i in 1:(length(date))){
      stri_sub(date[i],8,9) <- "-01"           # Insere "-01" na posição 8. Resultado:yyyy-mm-01
    }
    
    Date = as.Date(date, format = "%Y-%m-%d")  # Transforma em formato de Data
 
    
    
### Impotando dados com read.table e informando colClasses
    inicial <- read.table("datatable.txt", nrows = 100)
    classes <- sapply(inicial, class)
    data <- read.table("datatable.txt", colClasses = classes)
     
    
    
### Escrevendo em Latex com latex2exp
    TeX('$\\beta$')         # Letra grega beta  
    TeX('$E(R^e)$')         # Exemplo de expressão com índices  

    
    
### Gráfico com a função plot:
    par(mar = c(4,4.5,1,1))                      # Ajustando tamanho da margem 
    plot(x, y,                                   # Variáveis plotadas
         type ="p", pch = 20, cex = 2,           # Formatação do ponto plotado
         xlab = "nome eixo", ylab = "nome eixo", # Formatação do título dos eixos, em Latex
         xlim = c(0,1.5), ylim = c(0,1.5),       # Limites dos eixos (escala do gráfico)
         las = 1,                                # Labels do eixo y apresentados na horizontal
         cex.lab = 1.25,                         # Tamanho da fonte dos labels dos eixos  
         family = "serif")                       # Fonte das letras
    lines(c(0,1.5),c(0,y[5,1]*1.5))              # Plota uma reta entre as coordenadas (x,y) = (0,0) a (1.5, y*1.5)
    text(x,y,                                    # Acrescenta os labels aos pontos
         labels = c("nome 1", "nome 2"),
         cex = 0.6,                              # Tamanho da fonte
         pos = 3)                                # Posiciona os labels acima dos pontos
  
      
    
### Gráfico com a função ggplot:  
    # Função usa como input data um dataframe. Acrescenta camadas com o + no fim da linha.
    # aes() determina quais são as variáveis nos eixos x e y e outras características estéticas. 
      # Se for inserida em ggplot, é entendido como comando global.
      # Se for inserida dentro de uma geom, é entendida como parâmetro local para aquela geom.
       
    ggplot(data = DF) +                          
      geom_point(mapping = aes(x = X, y = Y, color = "Nome Y"),              # Cria um gráfico de pontos
                                                                               # Color dentro de aes cria legenda com o nome, color fora apenas muda a cor: color = "red"
                 size = 2,                                                   # Tamanho do ponto 
                 shape = 20) +                                               # Formato do ponto
      geom_line(mapping = aes(x = X, y = Z, color = "Nome Z")) +             # Cria um gráfico de linha
      scale_color_manual(values = c("Nome Y" = "blue", "Nome Z" = "red")) +  # Atribui cores às categorias
      labs(x = "Nome eixo X",                                                # Ajustando nomes dos eixos e legendas
           y = TeX('$nome com matemática$'),
           color =  "Título da legenda por cor") +
      coord_cartesian(xlim = c(0,25), ylim = c(0,15)) +                      # Limites dos eixos
      theme_classic()                                                        # Tema do gráfico: fundo branco, eixo em preto
    
    ggsave("Nome do gráfico.jpeg", grafico, width = 15, units = "cm")
    
    
    
### Criando nome de variáveis com a função paste() e exemplo do operador %>%
    # Seja x um data frame importado. Formato 1:
    N = ncol(x)                                       # Número de colunas de x
    nomes = paste("Característica",1:N, sep = " ")    # Vetor do tipo "Característica 1, Característica 2,..."
    names(x) = nomes
    
    # Formato 2: usando pipe operator
    x %>%
      set_colnames(paste("Característica",1:N, sep = " "))
    
    # Note: não criamos a variável "nomes", desnecessária
