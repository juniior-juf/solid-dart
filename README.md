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

Neste exemplo temos a classe Payment responsável por realizar pagamentos. A classe implementa dois métodos “pay()” e “sendReceiptByEmail()”, o primeiro método que efetua de fato o pagamento está dentro do escopo da classe, no entanto, o segundo método implementa uma ação (enviar comprovante por e-mail) que não faz parte do escopo da classe, tendo dessa forma mais de uma responsabilidade.

Para resolvermos isso, separamos as responsabilidades aplicando o SRP, como mostra o código abaixo:
![](https://github.com/juniior-juf/solid-dart/blob/main/images/code2.png)

Criamos uma classe chamada Email e movemos o método que implementa a funcionalidade de enviar comprovante da classe Payment para ela, dessa forma a classe Payment fica responsável somente por efetuar o pagamento e a classe Email por enviar o comprovante.

## O – Open-Closed Principle (Princípio do Aberto/Fechado)

> “Um artefato de software deve ser aberto para extensão, mas fechado para modificação.”

> “Você deve ser capaz de estender o comportamento de uma classe, sem modificá-lo.”

Este princípio diz que uma classe deve estar aberta para extensões e fechada para modificações, no sentido de que, uma classe com seu comportamento já implementado não deve ser alterada (exceto, para correções de bugs ou refactoring). Se houver a necessidade de modificar comportamento devemos estender esse comportamento sem que a implementação do comportamento anterior seja modificada.

Vejo um exemplo em que ocorre a quebra desse princípio.
![](https://github.com/juniior-juf/solid-dart/blob/main/images/code3.png)

Supondo que desejamos adicionar mais uma forma de pagamento (por exemplo: Pix), neste caso, teríamos que modificar o método “pay()” adicionando mais uma condição, como mostra o trecho de código a seguir:
![](https://github.com/juniior-juf/solid-dart/blob/main/images/code4.png)

Dessa forma, estamos alterando um método que já estava com sua implementação definida.

Para resolvermos isso, aplicamos o OCP. Criamos uma abstração de pagamento, que servirá como um modelo para os tipos de pagamento e conforme seja o tipo sobrescrevemos o método “pay()” para implementar o comportamento adequado.

Veja o exemplo a seguir:
![](https://github.com/juniior-juf/solid-dart/blob/main/images/code5.png)

Agora se quisermos adicionar o pagamento por Pix, basta criar uma classe que estenda ou implemente a classe Payment, com isso você será obrigado a sobrescrever o método “pay()” adicionando o comportamento do pagamento por pix, como mostra a seguir:
![](https://github.com/juniior-juf/solid-dart/blob/main/images/code6.png)

Assim, adicionamos mais um tipo de pagamento sem impactar os demais tipos já implementados, não havendo qualquer mudança.

## L – Liskov Substitution Principle (Princípio da Substituição de Liskov)

> “As classes derivadas devem ser substituíveis por suas classes base.”

Este princípio propõe que subclasses derivadas de uma superclasse devem ser capazes de serem substituídas pela própria superclasse, ou então, que uma subclasse possa ser substituída por outra subclasse sem que haja a quebra do sistema.

Para entendermos melhor esse princípio vamos ao exemplo:
![](https://github.com/juniior-juf/solid-dart/blob/main/images/code7.png)

Temos duas subclasses que são PaymentCard e PaymentBankSlip, ambas são herdadas da superclasse Payment, portanto, são obrigadas a implementar os métodos “pay()” e “selectFlag()”.

Quando instanciamos um objeto do tipo PaymentCard, que nesse caso também é do tipo Payment e executamos os métodos da classe, é esperado que a execução seja bem sucedida e de fato isso ocorre, porém, se tentarmos substituir a subclasse PaymentCard pela PaymentBankSlip e tentarmos excutar novamente os métodos, o sitema nos retorna uma exceção, isso ocorre devido o pagamento por boleto não ter implementado o comportamento de seleção de bandeira, comportamento este que é implementado somente para pagamentos com cartão, com isso, o código anterior viola o princípio SLP, visto que substituimos uma subclasse por outra ocasionando uma falha no sistema.

Para solucionar este problema, vamos fazer uso de um outro princípio do SOLID.

## I – Interface Segregation Principle (Princípio da Segregação de Interface)

> “Crie interfaces refinadas que sejam específicas do cliente.”

Neste príncipio classes derivadas de uma classe base nunca devem implementar comportamentos que não venham ser utlizados. Como mostra o exemplo do princípio anterior, em que o método “selectFlag()” não faz sentido na classe PaymentBankSlip.

Aplicando o princípio ISP podemos separar os métodos em classes abstratas que fazem sentido e implementamos somente aquilo que a subclasse irá fazer uso.

Como mostra o exemplo a seguir:
![](https://github.com/juniior-juf/solid-dart/blob/main/images/code8.png)

## D – Dependency Inversion Principle (Princípio de Inversão de Dependência)

> “Dependa de abstrações, não de concreções.”

O princípio diz que uma classe não deve depender de classes que possuem detalhes de implementações e sim de classes abstratas que somente ditam a regra de negócio.

Dito isso, o correto é não se referir a classes concretas, não derivar de classes concretas, não sobrescrever métodos ou funções que já possuem suas implementações definidas e sempre que possível não mencionar o nome de objetos que sejam concretos e sim mencionar suas abstrações.

No exemplo a seguir demonstramos como o DIP é violado:
![](https://github.com/juniior-juf/solid-dart/blob/main/images/code9.png)

Neste exemplo podemos notar que a classe PaymentController implementa o método “makePayment()” e que possui uma dependência com PaymentCard, porém, essa dependência está se referindo há um objeto concreto, caso fosse necessário substituir ou adicionar uma forma de pagamento, teríamos que criar um outro objeto concreto e alterar o método “makePayment()” ou então criar um outro método (Ex: makePaymentPix()) dentro PaymentController que instancie a classe concreta criada e realize o pagamento. Claro que essa abordagem não é o correto, devido ao alto nível de acoplamento que a classe possui, estaríamos ferindo outro princípio visto anteriormente, o OCP.

Então para solucionar esse problema, veremos o exemplo a seguir:
![](https://github.com/juniior-juf/solid-dart/blob/main/images/code10.png)

Veja que agora estamos dependendo de uma abstração e não de uma concretização, além disso, nossas classes concretas implementam uma abstração e não herdam de classes concreta. Com isso, removemos todo acoplamento que a classe PaymentController possuía.

Além disso, o princípio prega que classes de alto nível não devem depender de classes de baixo nível.

## Conclusão

Os princípios SOLID são de suma importância para construir aplicações mais flexíveis e escaláveis, onde mudanças mais especificas não impactam de maneira negativo o sistema como um todo, além disso, tornar o código mais bem estruturado e limpo. O SOLID nos orienta em como devemos abordar certas metodologias na implementação de classes e como essas classes devem ser interconectadas sem que haja um alto nível de acoplamento.

Por fim, visando conhecer e aprender mais sobre os princípios SOLID, elaborei esse pequeno artigo para meu próprio estudo e espero que de alguma forma esse conteúdo tenha ajudado você leitor durante a leitura.

Muito obrigado!

## Referência

- Martin, Robert C.. Arquitetura Limpa (Robert C. Martin) (p. 107). Alta Books. Edição do Kindle.
- [Agile Software Development, Principles, Patterns, and Practices, Robert C. Martin, Prentice Hall, 2002](http://www.butunclebob.com/ArticleS.UncleBob.PrinciplesOfOod)
