# Expenses 

Apresento  um aplicativo que oferece uma solução completa para o gerenciamento de despesas pessoais. Com ele, os usuários podem realizar um equilíbrio gráfico que proporciona uma visão clara e detalhada do seu estado financeiro, promovendo um controle financeiro de alta qualidade.

Uma das funcionalidades destacadas é a geração de gráficos de barras que representam de forma visual as datas registradas. Esses gráficos são construídos com base nos valores cadastrados para cada dia, proporcionando uma representação visual intuitiva e eficaz das despesas ao longo do tempo. Essa abordagem facilita a identificação de padrões de gastos, contribuindo para uma gestão financeira mais eficiente e informada.

## Conhecimentos Adquiridos nesse projeto 

Conhecimento em widgets do Material Design que identifica no Cupertino a implementação das diretrizes de interface humana para o android, pelo widget foi feito o controle de estado. Este tipo de widget não possibilitou as alterações dinâmicas, que alinhou o comportamento da interface estática.Eles foram  utilizados para a criação de estruturas não mutáveis nos aplicativos (telas, menus, imagens etc.), ou seja, para capturar informações vindas de entradas de dados dos usuários, Orientação a objetos e Arquiteturas padrões de projeto. 

Foi usado o List View que é o widget de rolagem. Ele exibe seus filhos um após o outro na direção de rolagem. No eixo transversal, os filhos são obrigados a preencher o ListView. Se não for nulo, o itemExtent força os filhos a terem a extensão especificada na direção de rolagem. Se não for nulo, o protótipoItem força os filhos a terem a mesma extensão que o widget fornecido na direção de rolagem. Especificar um itemExtent ou um protótipoItem é mais eficiente do que permitir que os filhos determinem sua própria extensão porque o mecanismo de rolagem pode fazer uso do conhecimento prévio da extensão dos filhos para economizar trabalho, por exemplo, quando a posição de rolagem muda drasticamente. Você não pode especificar ambos itemExtent e protótipoItem, apenas um ou nenhum deles.

Usei bibliotecas charts que é uma biblioteca de visualização de dados escrita nativamente em Dart para criar belos gráficos de barras para alto desempenho. Onde é feita por classes e distribui por varias extensões de plugins. 

## Dificuldades com o Flutter 

Algunas filters do tipo RaisedButton que foi abandonada do flutter e substituida pelo ElevetedButton, foi uma dificuldade que eu tive de procurar, pois havia alguns códigos não padronizados que dificultava o aceitamento dessa filters para efetuar containers e dimensionar os butões para registro das despesas pessoais. 

Enfrentei desafios ao estruturar os Containers em subcamadas. Em diversas situações, a disposição dessas camadas não seguia os padrões das telas, pois ocorria um redimensionamento que desalinhava as posições em relação ao layout padrão do aplicativo. 

## Tecnologias Utilizadas

-[Dart](https://dart.dev/guides) 

-[Flutter](https://docs.flutter.dev/)

## Recursos do Dart + Flutter 

-[Provider](https://pub.dev/packages/provider) 

-[Http](https://www.alura.com.br/conteudo/flutter-comunicacao-http) 

-[Cupertino_Icons](https://pub.dev/packages/cupertino_icons)

-[Intl](https://pub.dev/packages/intl)

## Baixar e visualizar o Projeto 

```bash 
  
  # fazer um git clone do projeto pelo terminal ou baixar e obter via winrar  
  
  $ Obter o Android Studio ou VsCode instalado na sua maquina
  
  $ Obter Java Jre e Jdk na versão 11.0 ou outras versões para ter o Android Instalado 
  
  $ Ativar o modulo desenvolvedor do Android no seu celular para testar o aplicativo 
  
```

 ## Como executar o projeto no terminal ou vscode

```bash
    # clonar repositório
    git clone https://github.com/ghdss26/Expenses.git

    # entrar na pasta do projeto cdp
    cd expenses 
  
    # executar o projeto
    flutter run

    Obs: Só siga esses passos, caso tenha o android Studio instalado e se for usuário linux 
```

 ## Visualização do Projeto 

 Visualize o projeto do Expenses, nesse link aqui: https://www.youtube.com/watch?v=DLzIUCGdMHc




