algoritmo "RegistroAbastecimento"

registro
    Abastecimento:
        data: cadeia
        quilometragem: inteiro
        combustivel: cadeia
        litros: real
        preco_litro: real

funcao ler_abastecimento() : Abastecimento
var
    abastecimento: Abastecimento

inicio
    escreva("Informe os dados do abastecimento:")
    leia(abastecimento.data)
    leia(abastecimento.quilometragem)
    leia(abastecimento.combustivel)
    leia(abastecimento.litros)
    leia(abastecimento.preco_litro)
    retorne abastecimento
fimfuncao

procedimento persistir_abastecimento(abastecimento: Abastecimento)
var
    arquivo: arquivo

inicio
    arquivo := fopen("abastecimentos.txt", "a")
    escreval(arquivo, concatena(concatena(concatena(concatena(concatena(abastecimento.data, ","), abastecimento.quilometragem), ","), abastecimento.combustivel), ","), abastecimento.litros)
    escreva(arquivo, concatena(",", abastecimento.preco_litro))
    fclose(arquivo)
    escreva("Abastecimento registrado com sucesso!")
fimprocedimento

funcao principal()
var
    opcao: caractere
    abastecimento: Abastecimento

inicio
    repita
        escreva("\nEscolha uma opção:")
        escreva("1. Registrar abastecimento")
        escreva("2. Sair")
        escreva("Opção: ")
        leia(opcao)

        se opcao = '1' entao
            abastecimento := ler_abastecimento()
            persistir_abastecimento(abastecimento)
        senao
            se opcao = '2' entao
                escreva("Encerrando o programa...")
            senao
                escreva("Opção inválida! Por favor, escolha novamente.")
            fimse
        fimse
    ate opcao = '2'
fimfuncao

inicio
    principal()
fimalgoritmo
