# BIBLIOTECA DE FUNÇÕES E COMANDOS NO R
# Ana Paula Nothen Ruhe

# ---------------------------------------
# 1. GERAL
  # Diretório: pasta onde os arquivos são salvos e abertos
    getwd()                    # Informa o diretório atual 
    setwd("C:/...")            # Altera o diretório para o endereço informado
  
  # Environment: espaço onde os objetos são armazenados
    ls()                       # Lista de todos os objetos no Environment
    rm()                       # Remove do environment o objeto indicado
    rm(list = ls())            # Limpa o environment
    
  # Ajuda e documentação: duas formas são equivalentes
    help(função) 
    ?função
    
  # Diversos:  
    class()                    # Indica a classe de um objeto
    length()                   # Indica o tamanho de um vetor
    str()                      # Compactly display the internal structure of an R object
    summary()                  # Semelhante a str()
    print(x, digits = y)       # Printa a variável x no console arredondando para y casas decimais
    numeric(n)                 # Cria vetor de 0 de tamanho n da classe numeric
     
   
  
  # Comandos lógicos:
    !    não
    
    
  # Instalação de pacotes:
    install.packages("nome")   
    library(nome)              # O pacote tem que ser lido cada vez que o R é aberto
 
  # Importar e exportar dados
    # Pacotes:  
      readxl                   # Ler arquivos de excel
      writexl                  # Salvar arquivos em excel
    
    # Funções:
      read.csv("C:/...")
      write.csv() 
      read_excel("C:/...")     (readxl)
      write_xlsx()             (writexl)  

      
  # Latex:
    latex2exp                  # Pacote que permite escrever em latex
    Tex()                      # Função para escrever em Latex
 
# ---------------------------------------
# 2. MANIPULAÇÃO DE DADOS
# 2.1 Pacotes
      tidyverse                # Conjunto de pacotes para data science
      dplyr                    # Manipular dados
      stats                    # Lidar com séries de tempo
      tseries                  # " "
      lubridate                # Lidar com datas
      stringi                  # Lidar com strings ("plural" de character)

      
      
# 2.2 Funções
      c()                      # Concatenar (juntar variáveis em vetor)
      rbind()                  # Junta vetores/matrizes/df empilhando as linhas
      data.frame()             # Criar dataframe a partir dos inputs
      - data.frame(nome1 = v1, nome2 = v2, row.names = vetordenomes)
      - Para acrescentar uma nova coluna "y": df$y = dadosy
      - Para excluir uma coluna "y": df$y = NULL
      as.data.frame()          # Transforma conjunto de dados em dataframe
      
      
      fix()    (utils)         # Permite corrigir os valores em um dataframe
      filter() (dplyr)         # Permite filtrar determinada característica nos dados (seleciona os dados que satisfazem a característica) 
      duplicated()             # Identifica dados com a característica citada duplicada
      names()                  # Atribui um nome y a um objeto x: names(x) = y
      names()[i]               # Atribui nome ao objeto i de um dataframe
      row.names                # Dá nome as linhas
      
      
      
# ---------------------------------------
# 3. FUNÇÕES
# 3.1 Matrizes
  t()                          # Transposta
  diag()                       # Diagonal principal
  matrix(dados,nrow,ncol)      # Cria uma matriz
      


      
# ---------------------------------------
# 4. ALGUNS EXEMPLOS
  # Editando o formato de data de um dataframe: coluna "date" veio no formato "yyyymm"    
    date <- as.character(df$date)              # Transforma em character
    
    for(i in 1:(length(date))){
      stri_sub(date[i],5,4) <- "-"             # Insere o character "-" na posição 5, sem excluir nenhum character pré-existente
    }                                          # Resultado: data no formato "yyyy-mm", ou Ym. Mas esse formato não é suportado, precisamos do dia
      
    for(i in 1:(length(date))){
      stri_sub(date[i],8,9) <- "-01"           # Insere "-01" na posição 8. Resultado:yyyy-mm-01
    }
    
    Date = as.Date(date, format = "%Y-%m-%d")  # Transforma em formato de Data
    
    
    
  # Escrevendo em Latex com latex2exp
    TeX('$\\beta$')         # Letra grega beta  
    TeX('$E(R^e)$')         # Exemplo de expressão com índices  

    
    
  # Gráfico com a função plot:
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
    
    
  # Gráfico com a função ggplot:  
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
    
    ggsave("Gráfico MV x Rho.jpeg", grafico, width = 15, units = "cm")
