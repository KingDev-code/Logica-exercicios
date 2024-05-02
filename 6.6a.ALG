algoritmo "ListaCircular"

var
    comeco: ponteiro

registro
    NoLista:
        item: inteiro
        prox: ponteiro

funcao Existe(posicao: inteiro): logico
var
    atual: ponteiro
inicio
    se comeco = nulo entao
        retorna falso
    senao
        atual := comeco
        enquanto verdadeiro faca
            se atual^.item = posicao entao
                retorna verdadeiro
            fimse
            atual := atual^.prox
            se atual = comeco entao
                retorna falso
            fimse
        fimenquanto
    fimse
fim

funcao Novo(): ponteiro
var
    novo: ponteiro
inicio
    novo := ponteiro para NoLista
    se comeco = nulo entao
        novo^.prox := novo
        comeco := novo
    senao
        novo^.prox := comeco^.prox
        comeco^.prox := novo
    fimse
    retorna novo
fim

procedimento Insere(info, antecessor: inteiro)
var
    pos, atual: ponteiro
inicio
    se nao Existe(antecessor) entao
        escreval("Antecessor não pertence à lista!")
    senao
        pos := Novo()
        pos^.item := info
        atual := comeco
        enquanto verdadeiro faca
            se atual^.item = antecessor entao
                pos^.prox := atual^.prox
                atual^.prox := pos
                interrompa
            fimse
            atual := atual^.prox
            se atual = comeco entao
                escreval("Antecessor não encontrado na lista!")
                interrompa
            fimse
        fimenquanto
    fimse
fim

procedimento Remove(posicao: inteiro)
var
    atual, anterior: ponteiro
inicio
    se comeco = nulo entao
        escreval("Lista vazia, não há elementos para remover.")
    senao
        atual := comeco
        anterior := nulo
        enquanto verdadeiro faca
            se atual^.item = posicao entao
                se anterior = nulo entao
                    comeco := atual^.prox
                    se atual^.prox = atual entao
                        comeco := nulo
                    senao
                        anterior := comeco
                        enquanto anterior^.prox <> atual faca
                            anterior := anterior^.prox
                        fimenquanto
                        anterior^.prox := comeco
                    fimse
                senao
                    anterior^.prox := atual^.prox
                fimse
                libere atual
                interrompa
            fimse
            anterior := atual
            atual := atual^.prox
            se atual = comeco entao
                escreval("Elemento não encontrado na lista.")
                interrompa
            fimse
        fimenquanto
    fimse
fim

inicio
    comeco := nulo

    // Exemplo de uso
    Insere(1, 0)  // Insere o elemento 1 na lista
    Remove(1)     // Remove o elemento 1 da lista
fimalgoritmo
