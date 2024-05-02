algoritmo "PilhaCircular"

var
    topo: ponteiro

registro
    NoPilha:
        item: inteiro
        prox: ponteiro

funcao EstaVazia(): logico
inicio
    retorna topo = nulo
fim

procedimento Empilhar(item: inteiro)
var
    novo_no: ponteiro
inicio
    novo_no := ponteiro para NoPilha
    novo_no^.item := item
    se EstaVazia() entao
        novo_no^.prox := novo_no  // Aponta para ele mesmo
        topo := novo_no
    senao
        novo_no^.prox := topo
        topo := novo_no
    fimse
fim

funcao Desempilhar(): inteiro
var
    item: inteiro
    atual: ponteiro
inicio
    se EstaVazia() entao
        escreva("Pilha vazia, não é possível desempilhar.")
        retorne 0  // Valor vazio para indicar erro
    item := topo^.item
    topo := topo^.prox
    se topo <> nulo entao
        atual := topo
        enquanto atual^.prox <> topo faca
            atual := atual^.prox
        fimenquanto
        atual^.prox := topo
    fimse
    retorne item
fim

inicio
    topo := nulo

    // Exemplo de uso
    Empilhar(1)
    Empilhar(2)
    Empilhar(3)
    escreval(Desempilhar())  // Saída: 3
    escreval(Desempilhar())  // Saída: 2
fimalgoritmo
