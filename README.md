# Pincípios SOLID - Dart

Antes de tudo, queria esclarecer que durante a leitura utilizaremos classes como exemplo, mas poderia ser um método, uma função, um módulo ou somente um arquivo de código-fonte que implemente um conjunto de dados e comportamentos. No entanto, como na maioria das vezes os princípios são aplicados em classes, utilizaremos ela para nosso estudo.

Então vamos ao que interessa.

## Porque SOLID?

A palavra SOLID nada mais é que a junção da primeira letra de cada princípio e a formação dessa palavra não se deu à toa. Por volta de 2004, Michael Feathers sugeriu que se os princípios se organizassem de forma correta, as primeiras letras formariam a palavra SOLID.

E os princípios SOLID tem como objetivo nos orientar em como devemos organizar conjuntos de dados e métodos ou funções dentro de classes e como essas classes podem ser interligadas.

## S – Single Responsibility Principle (Princípio da Responsabilidade Única)

> “Uma classe deve ter um, e apenas um, motivo para mudar.''
> “Um módulo deve ser responsável por um, e apenas um, ator.”

Não necessariamente uma classe deve ser responsável por realizar somente uma ação, na verdade o que o SRP quer nos dizer é que uma classe deve ser responsável por realizar ações que fazem parte daquele escopo de classe. Assim sendo, uma classe deve ter somente um motivo para poder ser alterada, que nesse caso, qualquer modificação deve ser refletida a somente um ator ou escopo de uma classe. Tendo como objetivo manter o código o mais simples possível e com funções que fazem sentido dentro de seu escopo.

A seguir, um exemplo que quebra o princípio do SRP.
![](https://github.com/juniior-juf/solid-dart/blob/main/images/code1.png)
