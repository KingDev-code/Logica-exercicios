algoritmo "RegMedida"

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
    medidas: RegMedida

inicio
    // Abre o arquivo para gravação
    arquivo: arquivo
    arquivo := fopen("medidas.txt", "w")

    escreva("Digite o dia da medida: ")
    leia(medidas.dia)
    escreva("Digite o mês da medida: ")
    leia(medidas.mes)
    escreva("Digite a altura em metros: ")
    leia(medidas.altura)
    escreva("Digite o peso em kg: ")
    leia(medidas.peso)
    escreva("Digite a medida da cintura em cm: ")
    leia(medidas.cintura)
    escreva("Digite a medida do abdômen em cm: ")
    leia(medidas.abdomen)
    escreva("Digite a medida do quadril em cm: ")
    leia(medidas.quadril)

    // Guarda a medida no arquivo
    escreval(arquivo, concatena(medidas.dia, ",", medidas.mes, ",", medidas.altura, ",", medidas.peso, ",", medidas.cintura, ",", medidas.abdomen, ",", medidas.quadril))

    escreva("Medida gravada com sucesso!")

    // Fecha o arquivo
    fclose(arquivo)
fimalgoritmo
