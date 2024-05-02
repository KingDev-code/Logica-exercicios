algoritmo "RegMedidaLeitura"

registro
    RegMedida:
        dia: inteiro
        mes: inteiro
        altura: real
        peso: real
        cintura: real
        abdomen: real
        quadril: real

var
    medidas: vetor[1..100] de RegMedida
    arquivo: arquivo
    linha, primeira_medida: cadeia
    peso1, IMC1, rCinQua1, peso2, difPeso, IMC2, difIMC, rCinQua2, difCinQua: real
    i: inteiro

inicio
    i := 1

    // Abre o arquivo para leitura
    arquivo := fopen("medidas.txt", "r")

    // Verifica se o arquivo foi aberto com sucesso
    se arquivo = -1 entao
        escreva("Erro ao abrir o arquivo.")
        pare
    fimse

    // Lê a primeira linha do arquivo
    leia(arquivo, linha)

    // Lê a primeira medição
    primeira_medida := linha
    peso1 := real(subst(linha, 11, 4))
    IMC1 := peso1 / real(subst(linha, 6, 4)) ^ 2
    rCinQua1 := real(subst(linha, 26, 5)) / real(subst(linha, 34, 5))

    escreva("Primeira medição:")
    escreva(concatena("Altura: ", subst(linha, 6, 4)))
    escreva(concatena("Peso: ", peso1))
    escreva(concatena("IMC: ", IMC1))
    escreva(concatena("Relação Cintura-Quadril: ", rCinQua1))

    medidas[i].altura := real(subst(linha, 6, 4))
    medidas[i].peso := peso1
    medidas[i].IMC := IMC1
    medidas[i].rCinQua := rCinQua1
    i := i + 1

    // Lê as demais medições
    enquanto nao eof(arquivo) faca
        leia(arquivo, linha)
        peso2 := real(subst(linha, 11, 4))
        difPeso := peso2 - peso1
        IMC2 := peso2 / real(subst(linha, 6, 4)) ^ 2
        difIMC := IMC2 - IMC1
        rCinQua2 := real(subst(linha, 26, 5)) / real(subst(linha, 34, 5))
        difCinQua := rCinQua2 - rCinQua1

        escreva("\nMedição:")
        escreva(concatena("Altura: ", subst(linha, 6, 4)))
        escreva(concatena("Peso: ", peso2))
        escreva(concatena("Diferença de Peso: ", difPeso))
        escreva(concatena("IMC: ", IMC2))
        escreva(concatena("Diferença de IMC: ", difIMC))
        escreva(concatena("Relação Cintura-Quadril: ", rCinQua2))
        escreva(concatena("Diferença de Relação Cintura-Quadril: ", difCinQua))

        medidas[i].altura := real(subst(linha, 6, 4))
        medidas[i].peso := peso2
        medidas[i].difPeso := difPeso
        medidas[i].IMC := IMC2
        medidas[i].difIMC := difIMC
        medidas[i].rCinQua := rCinQua2
        medidas[i].difCinQua := difCinQua
        i := i + 1
        peso1 := peso2
        IMC1 := IMC2
        rCinQua1 := rCinQua2
    fimenquanto

    escreva("\nMedições armazenadas:")
    para i de 1 ate i - 1 faca
        escreva(medidas[i].altura)
        escreva(medidas[i].peso)
        escreva(medidas[i].IMC)
        escreva(medidas[i].rCinQua)
    fimpara

    // Fecha o arquivo
    fclose(arquivo)
fimalgoritmo
