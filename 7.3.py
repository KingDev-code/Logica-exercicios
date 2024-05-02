import csv

def ler_arquivo(nome_arquivo):
    with open(nome_arquivo, 'r', newline='', encoding='utf-8') as arquivo:
        leitor = csv.DictReader(arquivo)
        dados = [linha for linha in leitor]
    return dados

def escrever_arquivo(nome_arquivo, dados):
    with open(nome_arquivo, 'w', newline='', encoding='utf-8') as arquivo:
        cabecalho = ['Nome', 'Endereço', 'Telefone', 'Bairro', 'Cidade', 'CEP', 'Data Nasc.']
        escritor = csv.DictWriter(arquivo, fieldnames=cabecalho)
        escritor.writeheader()
        for linha in dados:
            escritor.writerow(linha)

def unir_arquivos(arquivo1, arquivo2, arquivo_saida):
    dados_arquivo1 = ler_arquivo(arquivo1)
    dados_arquivo2 = ler_arquivo(arquivo2)
    
    pessoas_presentes_em_ambos = []
    for pessoa1 in dados_arquivo1:
        for pessoa2 in dados_arquivo2:
            if pessoa1['Nome'] == pessoa2['Nome']:
                nova_pessoa = {
                    'Nome': pessoa1['Nome'],
                    'Endereço': pessoa1['Endereço'],
                    'Telefone': pessoa1['Telefone'],
                    'Bairro': pessoa2['Bairro'],
                    'Cidade': pessoa2['Cidade'],
                    'CEP': pessoa2['CEP'],
                    'Data Nasc.': pessoa2['Data Nasc.']
                }
                pessoas_presentes_em_ambos.append(nova_pessoa)

    escrever_arquivo(arquivo_saida, pessoas_presentes_em_ambos)

def main():
    arquivo1 = 'pessoas1.csv'
    arquivo2 = 'pessoas2.csv'
    arquivo_saida = 'pessoas_unidas.csv'

    unir_arquivos(arquivo1, arquivo2, arquivo_saida)
    print(f"A união dos arquivos foi concluída. Os dados foram salvos em '{arquivo_saida}'.")

if __name__ == "__main__":
    main()
