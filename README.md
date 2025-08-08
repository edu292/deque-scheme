# Deque-Scheme: Uma Implementação Eficiente de Deques em R5RS Scheme

![Linguagem](https://img.shields.io/badge/linguagem-Scheme-blue.svg)
![Padrão](https://img.shields.io/badge/padrão-R5RS-orange.svg)
![Licença](https://img.shields.io/badge/licença-MIT-green.svg)

## Visão Geral

Este projeto apresenta uma implementação completa e robusta de um **Deque** (Double-Ended Queue, ou "fila de duas pontas") em R5RS Scheme. A estrutura foi projetada com foco em máxima eficiência e clareza, utilizando uma abordagem de lista duplamente ligada que garante performance de tempo constante para todas as operações de inserção e remoção.

Mais do que um simples código, este projeto é uma demonstração prática de como os princípios fundamentais da ciência da computação, como a **Abstração de Tipos de Dados (ADT)**, podem ser aplicados em uma linguagem minimalista como Scheme para criar software elegante, poderoso e de alta performance.

## O que é um Deque?

Um deque é uma estrutura de dados abstrata que generaliza uma fila. Mas diferentemente de uma fila comum, onde elementos só podem ser inseridos no final e removidos do início, um deque permite que a inserção e a remoção de elementos sejam feitas eficientemente em **ambas as extremidades**.

### ✨ Características Principais

#### 1. Eficiência de Tempo Constante: O(1)

A principal vantagem desta implementação é sua performance. Todas as operações fundamentais — inserção e deleção no início ou no fim — são executadas em **tempo constante**, ou O(1). Isso é possível graças à estrutura de dados subjacente, que mantém ponteiros diretos para o primeiro e o último nó da lista, garantindo que a performance não se degrade com o aumento do número de elementos.

#### 2. Implementação com Lista Duplamente Ligada

O deque é implementado através de uma **lista duplamente ligada**, com uma estrutura de controle (cabeçalho) que armazena os ponteiros para o início e o fim.

* **Cabeçalho do Deque:** Um par `(<ponteiro-inicio> . <ponteiro-fim>)` que oferece acesso imediato às extremidades.
* **Nós (Nodes):** Cada elemento do deque é armazenado em um nó, que contém o valor do elemento e dois ponteiros que formam a cadeia da lista (um para o nó a esquerda e outro para o a direita).

Esta arquitetura inteligente é a chave para a performance O(1) do sistema.

## 🏛️ O Design: ADT como Precursor da Orientação a Objetos

A verdadeira elegância deste projeto reside na sua aplicação rigorosa dos princípios de **Abstração de Tipos de Dados (ADT)**. Um ADT é definido por um conjunto de operações (sua **interface pública**), independentemente de sua implementação concreta. Este conceito é a semente do que hoje conhecemos como Programação Orientada a Objetos (OOP).

### A Barreira de Abstração

O código é dividido em duas camadas lógicas e independentes, criando uma forte **barreira de abstração**:

1.  **A API Pública do Deque:** Funções como `front-insert!` e `rear-delete!`. Esta camada entende a *lógica* de um deque e representa o **contrato** público da estrutura. Em OOP, esta seria a `interface` ou os `métodos públicos` de uma classe.
2.  **A Camada de Manipulação de Nós:** Funções auxiliares como `make-node` e `set-left-node!`. Esta camada conhece a *estrutura interna* de um nó (que é feito de pares `cons`). Em OOP, estes seriam os `detalhes de implementação` e os `campos privados` de uma classe.

Essa separação, ou **encapsulamento**, é crucial:

* **Manutenibilidade:** Se decidíssemos mudar a estrutura interna de um nó (de um par para um vetor, por exemplo), **apenas a camada de manipulação de nós precisaria ser alterada**. A lógica complexa do deque, que consome a API dos nós, permaneceria intacta. Isso é o mesmo princípio que permite trocar o motor de um carro sem precisar redesenhar o resto de sua estrutura.
* **Robustez:** Ao esconder os detalhes, prevenimos o uso incorreto da estrutura e reduzimos drasticamente a chance de erros de manipulação de ponteiros.

Programar com ADTs em Scheme, portanto, não é apenas um exercício acadêmico; é praticar a **essência do pensamento orientado a objetos**, mesmo sem usar a palavra-chave `class`.

## 💡 Scheme: O Poder da Simplicidade

Muitos programadores, ao verem Scheme, notam a ausência de uma vasta biblioteca de estruturas de dados prontas. Isso não é uma fraqueza; é a sua maior força. A filosofia do Scheme é fornecer ao desenvolvedor um conjunto pequeno, mas extremamente poderoso, de ferramentas primitivas e dar-lhe total liberdade para construir o que for necessário.

### O Par `cons` como Bloco de Construção Universal

Neste projeto, toda a complexidade de uma lista duplamente ligada foi construída a partir de um único tipo de estrutura: o **par**, criado pela função `cons`. O par é o "átomo" do Scheme. Com ele, podemos construir listas, árvores, grafos e, como demonstrado aqui, um deque de alta performance.

Ao contrário de linguagens que entregam estruturas complexas prontas, Scheme convida o desenvolvedor a entender essas estruturas em um nível fundamental. Você não apenas *usa* um deque; você *entende* o que faz um deque funcionar.

Essa abordagem oferece:

* **Liberdade Total:** Você não está limitado pelas decisões de design de outra pessoa. A estrutura de dados pode ser perfeitamente otimizada para o problema em questão.
* **Controle Absoluto:** Cada ponteiro, cada pedaço de memória, está sob o seu controle, permitindo a criação de implementações extremamente eficientes.
* **Profundo Entendimento:** Construir estruturas a partir de princípios básicos força uma compreensão mais profunda dos algoritmos, algo que muitas vezes se perde em meio a abstrações de alto nível.

Scheme prova que com uma sintaxe simples, um conjunto de regras consistente e ferramentas primitivas poderosas, um desenvolvedor tem tudo o que precisa para construir soluções elegantes para problemas complexos.

## 🎓 Inspiração Acadêmica: SICP e CS 61A

A inspiração para este projeto e a profunda apreciação pelos conceitos aqui aplicados vêm de duas fontes seminais na educação em ciência da computação:

* **O livro "Structure and Interpretation of Computer Programs" (SICP):** Considerado um dos textos mais importantes da área, o SICP (de Abelson, Sussman e Sussman) utiliza Scheme para ensinar conceitos fundamentais, incluindo a construção de sistemas complexos a partir de primitivas simples e o poder das barreiras de abstração.

* **O curso CS 61A da Universidade da Califórnia, Berkeley:** Este lendário curso introdutório, historicamente baseado no SICP, ensina os alunos a pensar sobre o design de software, a evolução histórica de paradigmas como a Programação Orientada a Objetos (OOP) e a reconhecer que OOP, embora poderosa, não é a única alternativa para escrever código bem estruturado e modular.

Este projeto de deque é, em essência, um exercício prático que reflete a filosofia do SICP e do CS 61A: a de que um verdadeiro entendimento de software vem da capacidade de construir e manipular abstrações.

## 📖 API da Biblioteca

A interface pública da biblioteca é simples e intuitiva.

| Função                  | Descrição                                         |
| :---------------------- | :------------------------------------------------ |
| `(make-deque)`          | Cria e retorna um novo deque vazio.               |
| `(empty? deque)`        | Retorna `#t` se o deque estiver vazio, `#f` caso contrário. |
| `(front deque)`         | Retorna o valor do elemento no início do deque.   |
| `(rear deque)`          | Retorna o valor do elemento no fim do deque.      |
| `(front-insert! deque valor)` | Adiciona um novo elemento no início do deque.     |
| `(rear-insert! deque valor)`  | Adiciona um novo elemento no fim do deque.        |
| `(front-delete! deque)` | Remove o elemento do início do deque.             |
| `(rear-delete! deque)`  | Remove o elemento do fim do deque.                |

## 🚀 Como Usar

```scheme
;; Carregue o arquivo da biblioteca
(load "deque.scm")

;; 1. Crie um novo deque
(define meu-deque (make-deque))

;; 2. Adicione elementos no início
(front-insert! meu-deque 'Neville)
(front-insert! meu-deque 'Sam)  ; O deque agora é: (Sam, Neville)

;; 3. Adicione elementos no fim
(rear-insert! meu-deque 'Frank) ; O deque agora é: (Sam, Neville, Frank)

;; 4. Verifique os elementos das pontas
(front meu-deque) ; Retorna 'Sam
(rear meu-deque)  ; Retorna 'Frank

;; 5. Remova elementos
(front-delete! meu-deque) ; Remove 'Sam. O deque agora é: (Neville, Frank)
(rear-delete! meu-deque)  ; Remove 'Frank. O deque agora é: (Neville)

(front meu-deque) ; Retorna 'Neville
```

## ⚖️ Licença

Este projeto é distribuído sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.
