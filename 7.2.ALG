algoritmo "RelatorioAbastecimentos"

registro
    Abastecimento:
        data: cadeia
        quilometragem: inteiro
        combustivel: cadeia
        litros: real
        preco_litro: real

funcao calcular_diferenca_preco(abastecimento_anterior: Abastecimento, abastecimento_atual: Abastecimento) : real
var
    diferenca_preco: real

inicio
    se abastecimento_anterior = nulo entao
        retorne 0.0
    senao
        diferenca_preco := (abastecimento_atual.litros * abastecimento_atual.preco_litro) - (abastecimento_anterior.litros * abastecimento_anterior.preco_litro)
        retorne diferenca_preco
    fimse
fimfuncao

funcao calcular_consumo_km_l(abastecimento_anterior: Abastecimento, abastecimento_atual: Abastecimento) : real
var
    consumo_km_l: real

inicio
    se abastecimento_anterior = nulo ou abastecimento_anterior.quilometragem = abastecimento_atual.quilometragem entao
        retorne 0.0
    senao
        consumo_km_l := (abastecimento_atual.quilometragem - abastecimento_anterior.quilometragem) / abastecimento_atual.litros
        retorne consumo_km_l
    fimse
fimfuncao

funcao ler_abastecimentos(arquivo: cadeia) : vetor de Abastecimento
var
    abastecimentos: vetor[1..100] de Abastecimento
    linha, dados: cadeia
    arquivo_abastecimentos: arquivo
    indice: inteiro

inicio
    abertura do arquivo_abastecimentos := fopen(arquivo, "r")
    se arquivo_abastecimentos <> nulo entao
        indice := 1
        enquanto nao(eof(arquivo_abastecimentos)) faca
            leia(arquivo_abastecimentos, linha)
            dados := linha
            abastecimentos[indice].data := token(dados, ",")
            abastecimentos[indice].quilometragem := inteiro(token(dados, ","))
            abastecimentos[indice].combustivel := token(dados, ",")
            abastecimentos[indice].litros := real(token(dados, ","))
            abastecimentos[indice].preco_litro := real(token(dados, ","))
            indice := indice + 1
        fimenquanto
        feche(arquivo_abastecimentos)
    fimse
    retorne abastecimentos
fimfuncao

procedimento gerar_relatorio(abastecimentos: vetor de Abastecimento)
var
    abastecimento_anterior: Abastecimento
    diferenca_preco, consumo_km_l, diferenca_consumo: real

inicio
    escreva("\nRelatório de Abastecimentos:")
    escreva("{:<12} {:<15} {:<12} {:<10} {:<10} {:<15} {:<20}", "Data", "Quilometragem", "Combustível", "Litros", "Preço/Litro", "Dif. Preço", "Consumo (km/l)", "Dif. Consumo")
    abastecimento_anterior := nulo
    para cada abastecimento_atual em abastecimentos faca
        diferenca_preco := calcular_diferenca_preco(abastecimento_anterior, abastecimento_atual)
        consumo_km_l := calcular_consumo_km_l(abastecimento_anterior, abastecimento_atual)
        se abastecimento_anterior <> nulo e tamanho(abastecimentos) > 1 entao
            diferenca_consumo := consumo_km_l - calcular_consumo_km_l(abastecimento_anterior, abastecimentos[tamanho(abastecimentos) - 1])
        senao
            diferenca_consumo := 0.0
        fimse
        escreva("{:<12} {:<15} {:<12} {:<10.2f} {:<10.2f} {:<15.2f} {:<20.2f}", abastecimento_atual.data, abastecimento_atual.quilometragem, abastecimento_atual.combustivel, abastecimento_atual.litros, abastecimento_atual.preco_litro, diferenca_preco, consumo_km_l, diferenca_consumo)
        abastecimento_anterior := abastecimento_atual
    fimpara
fimprocedimento

funcao principal()
var
    arquivo: cadeia
    abastecimentos: vetor[1..100] de Abastecimento

inicio
    arquivo := "abastecimentos.txt"
    abastecimentos := ler_abastecimentos(arquivo)
    gerar_relatorio(abastecimentos)
fimfuncao

inicio
    principal()
fimalgoritmo
