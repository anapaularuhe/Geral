# BIBLIOTECA DE FUNCOES E COMANDOS NO R
# Ana Paula Nothen Ruhe


# 1. GERAL --------------------------------------
  # Projeto: cria (ou associa a) pasta que concentra tudo relacionado ao projeto 
    # Garante um "fresh start" e salva as configurações aplicadas de forma independente de outros projetos
    # Permite trabalho colaborativo, pois arquivos e endereços passam a ser relativos ao diretório do projeto, e não absolutos
    # Em conjunto com o pacote "here"
    
    here::i_am("path_relativo_ao_project_root/nomedoscript.R") 
  
  
  # Environment: espaco onde os objetos sao armazenados
    ls()                       # Lista de todos os objetos no Environment
    rm()                       # Remove do environment o objeto indicado
    rm(list = ls())            # Limpa o environment -> Obs: limpa apenas os objetos criados pelo usuário, não as configurações (não garante um fresh start)
    
  # Configuracao de exibicaoo de casas decimais e notacaoo cientifica  
    options(scipen = 100, digits = n)    
    # scipen indica quantas casas guardar em decimais (evitando notacao cientifica)
    # digits indica quanto digitos exibir
    
  # Instalacao de pacotes:
    install.packages("nome")   
    library(nome)              # O pacote tem que ser lido cada vez que o R eh aberto
    
  # Ajuda e documentacao: duas formas sao equivalentes
    help(funcao) 
    ?funcao
    
    str()                      # Descreve a estrutura de um objeto. Por ex: mostra os argumentos da funcao   
    
  # Programacao eficiente:
    magrittr                   # Pacote com o operador "forward-pipe" %>% , que pode ser lido como "e entao". Mais info: https://uc-r.github.io/pipe
    alt -                      # Comando que gera o assingment symbol <-  
    
  # Diversos:  
    class()                    # Indica a classe de um objeto
    length()                   # Indica o tamanho de um vetor
    print(x, digits = y)       # Printa a variavel x no console arredondando para y casas decimais
    numeric(n)                 # Cria vetor de 0 de tamanho n da classe numeric
    vector()                   # Cria um vetor vazio; argumento "mode" determina a classe. Ex: vector(mode = "numeric") cria apenas o espa?o na mem?ria (pode transformar em vetor num?rico de qualquer tamanho).
                               ## Pode criar listas tambem: vector(mode = "list").
    list()                     # Transforma em lista os objetos dentro do ()
    paste()                    # Concatenate strings   
   
  
  # Comandos l?gicos:
    !    nao
    
 
  # Importar e exportar dados
    # Pacotes:  
      readxl                   # Ler arquivos de excel
      writexl                  # Salvar arquivos em excel
      readr                    # Pacote com fun??es otimizadas
    
    # Funcoes:
      read.csv("C:/...")
      write.csv() 
      read_excel("C:/...")     (readxl)
      write_xlsx()             (writexl)
      read.table               # Funcao para importacao de dados. Ver parametros no help. Informar colClasses torna processo muito mais rapido.
      
      read_csv                 (readr)    # Funcoes otimizadas. Muito mais rapidas na importacao dos dados! 
      read_table               (readr)    # ""

      readLines(..., n)        # Ler apenas primeiras n linhas 
 
    # Formatos próprios do R
      .Rds                     # Um único objeto
      .Rdata                   # Conjunto de objetos
      
      saveRDS(objeto, file = "nomedoarquivo.rds")       # Salva apenas o "objeto"
      save(list=ls(), file = "nomedoarquivo.Rdata")     # Todos os objetos no environment
      save(list=c(x,y,z), file = "nomedoarquivo.Rdata") # Salva os objetos x, y, z
      
      readRDS("nomedoarquivo.rds")
      load("nomedoarquivo.Rdata")
      
  # Latex:
    latex2exp                  # Pacote que permite escrever em latex
    Tex()                      # Funcao para escrever em Latex
    
    

# * 1.1 Debugging -------------------------------
    traceback()                # Deve ser chamada imediatamente apos receber um erro. Indica em que n?vel da fun??o o erro ocorreu.
    debug(f)                   # Toda vez que a fun??o f for chamada, abre o browser do debug
    undebug(f)                 # Desliga o gatilho de debug da fun??o f
    # Comandos no browser:
     # n: executa a expressao atual e move para a proxima
     # c: executa a funcao inteira ate o final ou ate um erro
     # Q: fecha o browser
    
    options(error = recover)   # Quando ocorre um erro, em vez de fechar a fun??o, abre op??es de browser.
    

# * 1.2 Profiling  ------------------------------
# "Profiling is a systematic way to examine how much time is spent in different parts of a program.
    system.time({})            # Retorna quanto tempo a express?o nos {} levou para processar
     # User time x system time (podem ser diferentes quando h? paraleliza??o)
    
    Rprof()                    # Liga o profiler. Passa a "contar o tempo"
    Rprof(NULL)                # Desliga o profiler. Retorna produto bruto do que foi feito enquanto estava ligado.
    summaryRprof()             # Tabula e "traduz" o tempo medido pelo profiler.
        

# 2. MANIPULA??O DE DADOS -----------------------
# * 2.1 Pacotes ---------------------------------
      tidyverse                # Conjunto de pacotes para data science
      dplyr                    # Manipular dados
      stats                    # Lidar com s?ries de tempo
      tseries                  # " "
      lubridate                # Lidar com datas
      stringi                  # Lidar com strings ("plural" de character)
      boot                     # Simula??o com bootstrap
 
      
      
# * 2.2 Fun??es ----------------------------------
  # Criar data frames:
    data.frame()               # Criar dataframe a partir dos inputs
    - data.frame(nome1 = v1, nome2 = v2, row.names = vetordenomes)
    - Para acrescentar uma nova coluna "y": df$y = dadosy
    - Para excluir uma coluna "y": df$y = NULL
    as.data.frame()            # Transforma conjunto de dados em dataframe
    
  # Concatena??o:
    c()                        # Concatenar (juntar vari?veis em vetor)
    rbind()                    # Junta vetores/matrizes/df empilhando as linhas
    cbind()                    # Junta vetores/matrizes/df empilhando as colunas
    fix()                      # Permite corrigir os valores em um dataframe
    duplicated()               # Identifica dados com a caracter?stica citada duplicada
      
    
  # Pacote dplyr:
    select()                   # Seleciona um subconjunto das COLUNAS de um dataframe
    filter()                   # Seleciona um subconjunto das LINHAS de um dataframe, filtrando por determinada caracter?stica (condi??o l?gica)   
    arrange()                  # Reordena as linha
    rename()                   # Muda o nome das vari?veis
    mutate()                   # Adiciona novas vari?veis (colunas) ou transforma vari?veis existentes
    summarize()                # Gera um resumo de estat?sticas descritivas das vari?veis no dataframe
    
   
  # Subconjuntos de dados:
    split(x,factor)            # Divide o df x em grupos determinados por factor
    gl(n,k)                    # Fun??o generate levels: cria fator que divide em n grupos de k elementos 

    # Ex: split(x,gl(n,k)) divide o df x em n grupos de k elementos. 
    # Ex2: Split pode usar categoria j? existente do df: split(DF, DF$month) 
    # Ex3: lapply(split(x,factor),f) : aplica a fun??o f aos subgrupos de x gerados pelo factor (que pode ser gerado por gl) 
        
    quantile()                 # Divide o array ou df em quantis, informando os % desejados   
    subset()                   # Retorna um subconjunto do df/array que satisfaz uma condi??o l?gica. Para df, retorna LINHAS.
    unique()                   # Remove elementos repetidos   
        
     
  # Fun??es para nomear objetos:   
    # Data frame:  
      names()                  # Atribui um nome y a um objeto x: names(x) = y
      names()[i]               # Atribui nome ao objeto i de um dataframe
      rename()                 # Muda o nome das vari?veis
      row.names                # D? nome as linhas
    # Matriz:
      colnames()
      rownames()      
      
    make.names()               # Converte um vetor character em uma lista de nomes sintaticamente v?lidos para as vari?veis (tira espa?os e outros s?mbolos n?o suportados) 
      
      
# * 2.3 Estat?sticas descritivas ----------------
  skimr                        # Pacote    
  skimr::skim_to_wide()        # Fun??o - Retorna um data frame com um resumo das informa??es de forma visualmente organizada
  
  summary()                    # Semelhante a str()
  summarize()                  # Gera um resumo de estat?sticas descritivas das vari?veis
  
  
  
# * 2.4 Datas e Tempo ---------------------------
  # Data: classe DATE
  # Tempo: classes POSIXct e POIXlt
  
  # Fun??es para convers?o:
    strptime()                 # Fun??o para converter Time <=> Character 
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
      
    
    
# 4. FUN??ES ------------------------------------
# * 4.1 Matrizes --------------------------------
  t()                          # Transposta
  diag()                       # diag(A) = vetor das entradas da diagonal principal; diag(x) = retorna matriz diagonal com elementos de x
  solve()                      # Inversa (fun??o que resolve sistemas de equa??es)
  det()                        # Determinante
  dim()                        # N? dimens?es
  nrow()
  ncol()
  matrix(dados,nrow,ncol)      # Cria uma matriz
  
  # Opera??es: 
    A*B                        # Multiplica??o point-wise
    A/B                        # Divis?o point-wise
    A%*%B                      # Multiplica??o de matrizes
    colSums()                  # Soma dos valores nas colunas
    rowSums()                  # Soma dos valores nas linhas
    colMeans()                 # M?dia das colunas
    rowMeans()                 # M?dia das linhas
      
    

# *4.2 Otimiza??o -------------------------------
  optimize()                   # Geral, 1 dimens?o
  optim()                      # Geral, n dimens?es
  lp()        (lpSolve)        # Programa??o linear (objetivo e restri??es lineares)
  solve.QP    (quadprog)       # Programa??o quadr?tica (objetivo quadr?tica, restri??es lineares)
  optimize    (optimize)       # Programa??o n?o-linear
  optimx      (optimx)         # Programa??o n?o-linear
  # Mais detalhes: https://cran.r-project.org/web/views/Optimization.html 
  #                https://www.is.uni-freiburg.de/resources/computational-economics/5_OptimizationR.pdf


  
# * 4.3 Vari?veis aleat?rias --------------------
  # Grupos de fun??es de vari?veis aleat?rias:
    # r: random number generator
    # d: density function 
    # p: cumulative function
    # q: quantile function (inverse cumulative function): valor cr?tico tabelado
  
  runif()                      # Gerar V.A. a partir da distribui??o uniforme
  rnorm()                      # Gerar V.A. a partir da distribui??o normal  
  rbinom()                     # Gerar V.A. a partir da distribui??o binomial
  rpois()                      # Gerar V.A. a partir da distribui??o Poisson
  
  # Simula??o: gerando n?meros aleat?rios replic?veis
  set.seed()
  
  sample(x,n)                  # Sorteia n elementos de x. Permuta??o: n?o informar n. Argumento: replace (TRUE or FALSE).    

    
# * 4.4 Loops -----------------------------------
  seq_along()                  # seq_along(x) gera a sequ?ncia de inteiros 1:length(x). Para X matriz: seq_along(nrow(X))
  lapply(x, f, ...)            # Loop que aplica a fun??o f nos elementos da lista x; Output sempre ? uma lista. x ? usado como primeiro argumento de f, outros argumentos podem ser informados nos ...  
  sapply(x, f, ...)            # Como lapply, mas simplifica o output (ex: se x ? vetor, retorna vetor f(x) e n?o lista)
  tapply(x, index, f, ...)     # Exclusiva para vetores: aplica a fun??o f a subgrupos de x definidos pelo fator index; equivalente a combina??o de loop + split      
  apply(x, margin, f, ...)     # Avalia a fun??o f em uma dimens?o (margin) do array x. Ex: aplicar fun??o nas linhas (margin = 1) de uma matriz 
                                 # Caso geral das fun??es rowSums/colSums e rowMeans/colMeans
  mapply(f,x,y)                # Loop multivariado: aplica a fun??o f, passando a lista x como primeiro argumento e a lista y como segundo argumento. Resulta: f(x1,y1), f(x2,y2), ...
                              
  
  
     
# 5. ALGUNS EXEMPLOS ----------------------------
### Editando o formato de data de um dataframe: coluna "date" veio no formato "yyyymm"    
    date <- as.character(df$date)              # Transforma em character
    
    for(i in 1:(length(date))){
      stri_sub(date[i],5,4) <- "-"             # Insere o character "-" na posi??o 5, sem excluir nenhum character pr?-existente
    }                                          # Resultado: data no formato "yyyy-mm", ou Ym. Mas esse formato n?o ? suportado, precisamos do dia
      
    for(i in 1:(length(date))){
      stri_sub(date[i],8,9) <- "-01"           # Insere "-01" na posi??o 8. Resultado:yyyy-mm-01
    }
    
    Date = as.Date(date, format = "%Y-%m-%d")  # Transforma em formato de Data
 
    
    
### Impotando dados com read.table e informando colClasses
    inicial <- read.table("datatable.txt", nrows = 100)
    classes <- sapply(inicial, class)
    data <- read.table("datatable.txt", colClasses = classes)
     
    
    
### Escrevendo em Latex com latex2exp
    TeX('$\\beta$')         # Letra grega beta  
    TeX('$E(R^e)$')         # Exemplo de express?o com ?ndices  

    
    
### Gr?fico com a fun??o plot:
    par(mar = c(4,4.5,1,1))                      # Ajustando tamanho da margem 
    plot(x, y,                                   # Vari?veis plotadas
         type ="p", pch = 20, cex = 2,           # Formata??o do ponto plotado
         xlab = "nome eixo", ylab = "nome eixo", # Formata??o do t?tulo dos eixos, em Latex
         xlim = c(0,1.5), ylim = c(0,1.5),       # Limites dos eixos (escala do gr?fico)
         las = 1,                                # Labels do eixo y apresentados na horizontal
         cex.lab = 1.25,                         # Tamanho da fonte dos labels dos eixos  
         family = "serif")                       # Fonte das letras
    lines(c(0,1.5),c(0,y[5,1]*1.5))              # Plota uma reta entre as coordenadas (x,y) = (0,0) a (1.5, y*1.5)
    text(x,y,                                    # Acrescenta os labels aos pontos
         labels = c("nome 1", "nome 2"),
         cex = 0.6,                              # Tamanho da fonte
         pos = 3)                                # Posiciona os labels acima dos pontos
  
      
    
### Gr?fico com a fun??o ggplot:  
    # Fun??o usa como input data um dataframe. Acrescenta camadas com o + no fim da linha.
    # aes() determina quais s?o as vari?veis nos eixos x e y e outras caracter?sticas est?ticas. 
      # Se for inserida em ggplot, ? entendido como comando global.
      # Se for inserida dentro de uma geom, ? entendida como par?metro local para aquela geom.
       
    ggplot(data = DF) +                          
      geom_point(mapping = aes(x = X, y = Y, color = "Nome Y"),              # Cria um gr?fico de pontos
                                                                               # Color dentro de aes cria legenda com o nome, color fora apenas muda a cor: color = "red"
                 size = 2,                                                   # Tamanho do ponto 
                 shape = 20) +                                               # Formato do ponto
      geom_line(mapping = aes(x = X, y = Z, color = "Nome Z")) +             # Cria um gr?fico de linha
      scale_color_manual(values = c("Nome Y" = "blue", "Nome Z" = "red")) +  # Atribui cores ?s categorias
      labs(x = "Nome eixo X",                                                # Ajustando nomes dos eixos e legendas
           y = TeX('$nome com matem?tica$'),
           color =  "T?tulo da legenda por cor") +
      coord_cartesian(xlim = c(0,25), ylim = c(0,15)) +                      # Limites dos eixos
      theme_classic()                                                        # Tema do gr?fico: fundo branco, eixo em preto
    
    ggsave("Nome do gr?fico.jpeg", grafico, width = 15, units = "cm")
    
    
    
### Criando nome de vari?veis com a fun??o paste() e exemplo do operador %>%
    # Seja x um data frame importado. Formato 1:
    N = ncol(x)                                       # N?mero de colunas de x
    nomes = paste("Caracter?stica",1:N, sep = " ")    # Vetor do tipo "Caracter?stica 1, Caracter?stica 2,..."
    names(x) = nomes
    
    # Formato 2: usando pipe operator
    x %>%
      set_colnames(paste("Caracter?stica",1:N, sep = " "))
    
    # Note: n?o criamos a vari?vel "nomes", desnecess?ria
