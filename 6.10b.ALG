algoritmo "PilhaAtivacaoCircular"

var
    topo: ponteiro

registro
    NoPilhaAtivacao:
        nome: caractere
        retorno: caractere
        prox: ponteiro

funcao EstaVazia(): logico
inicio
    retorna topo = nulo
fim

procedimento Empilhar(nome, retorno: caractere)
var
    novo_no: ponteiro
inicio
    novo_no := ponteiro para NoPilhaAtivacao
    novo_no^.nome := nome
    novo_no^.retorno := retorno
    se EstaVazia() entao
        novo_no^.prox := novo_no  // Aponta para ele mesmo
        topo := novo_no
    senao
        novo_no^.prox := topo
        topo := novo_no
    fimse
fim

funcao Desempilhar(): caractere
var
    nome: caractere
    atual: ponteiro
inicio
    se EstaVazia() entao
        escreva("Pilha de ativa��o vazia, n�o � poss�vel desempilhar.")
        retorne ""  // String vazia para indicar erro
    nome := topo^.nome
    topo := topo^.prox
    se topo <> nulo entao
        atual := topo
        enquanto atual^.prox <> topo faca
            atual := atual^.prox
        fimenquanto
        atual^.prox := topo
    fimse
    retorne nome
fim

inicio
    topo := nulo

    // Exemplo de uso
    Empilhar("Fun��o A", "Main")
    Empilhar("Fun��o B", "Fun��o A")
    Empilhar("Fun��o C", "Fun��o B")
    escreval(Desempilhar())  // Sa�da: Fun��o C
    escreval(Desempilhar())  // Sa�da: Fun��o B
fimalgoritmo
