algoritmo "UnirArquivos"

registro
    Pessoa:
        Nome: cadeia
        Endereco: cadeia
        Telefone: cadeia
        Bairro: cadeia
        Cidade: cadeia
        CEP: cadeia
        DataNascimento: cadeia

funcao LerArquivo(nome_arquivo: cadeia) : vetor de Pessoa
var
    arquivo: arquivo
    linha: cadeia
    pessoas: vetor[1..100] de Pessoa
    indice: inteiro

inicio
    abra(arquivo, nome_arquivo, "leitura")
    se arquivo <> nulo entao
        indice := 1
        enquanto nao(eof(arquivo)) faca
            leia(arquivo, linha)
            pessoas[indice].Nome := token(linha, ";")
            pessoas[indice].Endereco := token(linha, ";")
            pessoas[indice].Telefone := token(linha, ";")
            pessoas[indice].Bairro := token(linha, ";")
            pessoas[indice].Cidade := token(linha, ";")
            pessoas[indice].CEP := token(linha, ";")
            pessoas[indice].DataNascimento := token(linha, ";")
            indice := indice + 1
        fimenquanto
        feche(arquivo)
    fimse
    retorne pessoas
fimfuncao

procedimento EscreverArquivo(nome_arquivo: cadeia, dados: vetor de Pessoa)
var
    arquivo: arquivo
    indice: inteiro

inicio
    abra(arquivo, nome_arquivo, "escrita")
    para indice de 1 ate tamanho(dados) faca
        escreva(arquivo, dados[indice].Nome, ";", dados[indice].Endereco, ";", dados[indice].Telefone, ";", dados[indice].Bairro, ";", dados[indice].Cidade, ";", dados[indice].CEP, ";", dados[indice].DataNascimento)
    fimpara
    feche(arquivo)
fimprocedimento

procedimento UnirArquivos(arquivo1: cadeia, arquivo2: cadeia, arquivo_saida: cadeia)
var
    dados_arquivo1, dados_arquivo2: vetor de Pessoa
    pessoas_presentes_em_ambos: vetor[1..100] de Pessoa
    indice1, indice2: inteiro

inicio
    dados_arquivo1 := LerArquivo(arquivo1)
    dados_arquivo2 := LerArquivo(arquivo2)

    indice1 := 1
    enquanto indice1 <= tamanho(dados_arquivo1) faca
        indice2 := 1
        enquanto indice2 <= tamanho(dados_arquivo2) faca
            se dados_arquivo1[indice1].Nome = dados_arquivo2[indice2].Nome entao
                pessoas_presentes_em_ambos[indice1].Nome := dados_arquivo1[indice1].Nome
                pessoas_presentes_em_ambos[indice1].Endereco := dados_arquivo1[indice1].Endereco
                pessoas_presentes_em_ambos[indice1].Telefone := dados_arquivo1[indice1].Telefone
                pessoas_presentes_em_ambos[indice1].Bairro := dados_arquivo2[indice2].Bairro
                pessoas_presentes_em_ambos[indice1].Cidade := dados_arquivo2[indice2].Cidade
                pessoas_presentes_em_ambos[indice1].CEP := dados_arquivo2[indice2].CEP
                pessoas_presentes_em_ambos[indice1].DataNascimento := dados_arquivo2[indice2].DataNascimento
            fimse
            indice2 := indice2 + 1
        fimenquanto
        indice1 := indice1 + 1
    fimenquanto

    EscreverArquivo(arquivo_saida, pessoas_presentes_em_ambos)
    escreva("A uniao dos arquivos foi concluida. Os dados foram salvos em '", arquivo_saida, "'.")
fimprocedimento

funcao principal()
var
    arquivo1, arquivo2, arquivo_saida: cadeia

inicio
    arquivo1 := "pessoas1.csv"
    arquivo2 := "pessoas2.csv"
    arquivo_saida := "pessoas_unidas.csv"

    UnirArquivos(arquivo1, arquivo2, arquivo_saida)
fimfuncao

inicio
    principal()
fimalgoritmo
