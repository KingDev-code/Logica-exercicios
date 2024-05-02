algoritmo "Gerenciamento de Nomes"

registro
    Nomes:
        nomes_homem: vetor[1..100] de caractere
        nomes_mulher: vetor[1..100] de caractere
        contador_homem: inteiro
        contador_mulher: inteiro

funcao EstaVazio(lista: vetor[1..100] de caractere, contador: inteiro): logico
inicio
    retorna contador = 0
fim

procedimento IncluirNome(lista: vetor[1..100] de caractere, nome: caractere, contador: inteiro)
inicio
    se contador < 100 entao
        contador := contador + 1
        lista[contador] := nome
    senao
        escreval("A lista está cheia, não é possível incluir mais nomes.")
    fimse
fim

procedimento ExcluirNome(lista: vetor[1..100] de caractere, nome: caractere, contador: inteiro)
var
    i: inteiro
    encontrado: logico
inicio
    encontrado := falso
    para i de 1 ate contador faca
        se lista[i] = nome entao
            encontrado := verdadeiro
            para j de i ate contador - 1 faca
                lista[j] := lista[j + 1]
            fimpara
            contador := contador - 1
            lista[contador + 1] := ""
        fimse
    fimpara
    se nao encontrado entao
        escreval("O nome ", nome, " não está na lista.")
    fimse
fim

funcao LocalizarEAlterarNome(lista: vetor[1..100] de caractere, nome: caractere, novo_nome: caractere, contador: inteiro): logico
var
    i: inteiro
    encontrado: logico
inicio
    encontrado := falso
    para i de 1 ate contador faca
        se lista[i] = nome entao
            encontrado := verdadeiro
            lista[i] := novo_nome
            retorna verdadeiro
        fimse
    fimpara
    se nao encontrado entao
        escreval("O nome ", nome, " não está na lista.")
    fimse
    retorna falso
fim

procedimento ListarNomes(lista: vetor[1..100] de caractere, contador: inteiro)
var
    i: inteiro
inicio
    para i de 1 ate contador faca
        se lista[i] <> "" entao
            escreva(lista[i], " ")
        fimse
    fimpara
    escreval()
fim

inicio
    // Criando as listas e contadores
    nomes_homem: vetor[1..100] de caractere
    nomes_mulher: vetor[1..100] de caractere
    contador_homem := 0
    contador_mulher := 0

    // Exemplo de uso
    IncluirNome(nomes_homem, "João", contador_homem)
    IncluirNome(nomes_mulher, "Maria", contador_mulher)
    escreval("Nomes de homens:")
    ListarNomes(nomes_homem, contador_homem)
    escreval("Nomes de mulheres:")
    ListarNomes(nomes_mulher, contador_mulher)

    IncluirNome(nomes_homem, "Pedro", contador_homem)
    IncluirNome(nomes_mulher, "Ana", contador_mulher)
    escreval("Nomes de homens:")
    ListarNomes(nomes_homem, contador_homem)
    escreval("Nomes de mulheres:")
    ListarNomes(nomes_mulher, contador_mulher)

    ExcluirNome(nomes_homem, "João", contador_homem)
    ExcluirNome(nomes_mulher, "Maria", contador_mulher)
    escreval("Nomes de homens:")
    ListarNomes(nomes_homem, contador_homem)
    escreval("Nomes de mulheres:")
    ListarNomes(nomes_mulher, contador_mulher)

    ExcluirNome(nomes_homem, "Pedro", contador_homem)
    ExcluirNome(nomes_mulher, "Ana", contador_mulher)
    escreval("Nomes de homens:")
    ListarNomes(nomes_homem, contador_homem)
    escreval("Nomes de mulheres:")
    ListarNomes(nomes_mulher, contador_mulher)

    if LocalizarEAlterarNome(nomes_homem, "José", "Carlos", contador_homem) entao
        escreval("Nome alterado com sucesso!")
    fimse
    if LocalizarEAlterarNome(nomes_mulher, "Mariana", "Camila", contador_mulher) entao
        escreval("Nome alterado com sucesso!")
    fimse
    escreval("Nomes de homens:")
    ListarNomes(nomes_homem, contador_homem)
    escreval("Nomes de mulheres:")
    ListarNomes(nomes_mulher, contador_mulher)
fimalgoritmo