class Abastecimento:
    def __init__(self, data='', quilometragem=0, combustivel='', litros=0.0, preco_litro=0.0):
        self.data = data
        self.quilometragem = quilometragem
        self.combustivel = combustivel
        self.litros = litros
        self.preco_litro = preco_litro

def ler_abastecimento():
    print("Informe os dados do abastecimento:")
    data = input("Data do abastecimento (DD/MM/AAAA): ")
    quilometragem = int(input("Quilometragem do veículo: "))
    combustivel = input("Tipo de combustível: ")
    litros = float(input("Quantidade de litros abastecidos: "))
    preco_litro = float(input("Preço do litro: "))
    return Abastecimento(data, quilometragem, combustivel, litros, preco_litro)

def persistir_abastecimento(abastecimento):
    with open('abastecimentos.txt', 'a') as arquivo:
        arquivo.write(f"{abastecimento.data},{abastecimento.quilometragem},{abastecimento.combustivel},"
                      f"{abastecimento.litros},{abastecimento.preco_litro}\n")
    print("Abastecimento registrado com sucesso!")

def main():
    while True:
        opcao = input("\nEscolha uma opção:\n1. Registrar abastecimento\n2. Sair\nOpção: ")
        if opcao == '1':
            abastecimento = ler_abastecimento()
            persistir_abastecimento(abastecimento)
        elif opcao == '2':
            print("Encerrando o programa...")
            break
        else:
            print("Opção inválida! Por favor, escolha novamente.")

if __name__ == "__main__":
    main()
