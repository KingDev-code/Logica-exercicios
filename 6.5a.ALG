algoritmo "ListaDuplamenteEncadeada"

registro
    NoLista:
        item: inteiro
        prox: ponteiro
        ant: ponteiro

var
    comeco, fim: ponteiro

funcao Existe(posicao: inteiro): logico
var
    atual: ponteiro
    atual := comeco
    enquanto atual <> nulo faca
        se atual^.item = posicao entao
            retorna verdadeiro
        fimse
        atual := atual^.prox
    fimenquanto
    retorna falso
fim

funcao Novo(): ponteiro
var
    novo: ponteiro

    novo := ponteiro para NoLista
    novo^.ant := nulo
    se comeco = nulo entao
        comeco := novo
        fim := novo
    senao
        novo^.ant := fim
        fim^.prox := novo
        fim := novo
    fimse
    retorna novo
fim

procedimento Insere(info, antecessor: inteiro)
var
    pos, atual: ponteiro
    se nao Existe(antecessor) entao
        escreval("Antecessor nao pertence a lista!")
    senao
        pos := Novo()
        pos^.item := info
        atual := comeco
        enquanto atual <> nulo e atual^.item <> antecessor faca
            atual := atual^.prox
        fimenquanto
        se atual^.ant = nulo entao
            pos^.prox := comeco
            comeco^.ant := pos
            comeco := pos
        senao
            pos^.prox := atual
            pos^.ant := atual^.ant
            atual^.ant^.prox := pos
            atual^.ant := pos
        fimse
    fimse
fim
    comeco := nulo

    // Testando o algoritmo
    Insere(10, 0)  // Insere o elemento 10 na lista
    Insere(20, 10)  // Insere o elemento 20 ap�s o elemento 10
    Insere(30, 20)  // Insere o elemento 30 ap�s o elemento 20
    Insere(40, 30)  // Insere o elemento 40 ap�s o elemento 30
fimalgoritmo
