class Abastecimento:
    def __init__(self, data='', quilometragem=0, combustivel='', litros=0.0, preco_litro=0.0):
        self.data = data
        self.quilometragem = quilometragem
        self.combustivel = combustivel
        self.litros = litros
        self.preco_litro = preco_litro

def calcular_diferenca_preco(abastecimento_anterior, abastecimento_atual):
    if abastecimento_anterior is None:
        return 0.0
    return (abastecimento_atual.litros * abastecimento_atual.preco_litro) - \
           (abastecimento_anterior.litros * abastecimento_anterior.preco_litro)

def calcular_consumo_km_l(abastecimento_anterior, abastecimento_atual):
    if abastecimento_anterior is None or abastecimento_anterior.quilometragem == abastecimento_atual.quilometragem:
        return 0.0
    return (abastecimento_atual.quilometragem - abastecimento_anterior.quilometragem) / abastecimento_atual.litros

def ler_abastecimentos(arquivo):
    abastecimentos = []
    with open(arquivo, 'r') as arquivo_abastecimentos:
        linhas = arquivo_abastecimentos.readlines()
        for linha in linhas:
            dados = linha.strip().split(',')
            abastecimento = Abastecimento(data=dados[0], quilometragem=int(dados[1]), combustivel=dados[2],
                                           litros=float(dados[3]), preco_litro=float(dados[4]))
            abastecimentos.append(abastecimento)
    return abastecimentos

def gerar_relatorio(abastecimentos):
    print("\nRelatório de Abastecimentos:")
    print("{:<12} {:<15} {:<12} {:<10} {:<10} {:<15} {:<20}".format("Data", "Quilometragem", "Combustível",
                                                                     "Litros", "Preço/Litro", "Dif. Preço",
                                                                     "Consumo (km/l)", "Dif. Consumo"))
    abastecimento_anterior = None
    for abastecimento_atual in abastecimentos:
        diferenca_preco = calcular_diferenca_preco(abastecimento_anterior, abastecimento_atual)
        consumo_km_l = calcular_consumo_km_l(abastecimento_anterior, abastecimento_atual)
        diferenca_consumo = consumo_km_l - calcular_consumo_km_l(abastecimento_anterior, abastecimentos[-2]) \
            if len(abastecimentos) > 1 else 0.0
        print("{:<12} {:<15} {:<12} {:<10.2f} {:<10.2f} {:<15.2f} {:<20.2f}".format(abastecimento_atual.data,
                                                                                     abastecimento_atual.quilometragem,
                                                                                     abastecimento_atual.combustivel,
                                                                                     abastecimento_atual.litros,
                                                                                     abastecimento_atual.preco_litro,
                                                                                     diferenca_preco,
                                                                                     consumo_km_l, diferenca_consumo))
        abastecimento_anterior = abastecimento_atual

def main():
    arquivo = 'abastecimentos.txt'
    abastecimentos = ler_abastecimentos(arquivo)
    gerar_relatorio(abastecimentos)

if __name__ == "__main__":
    main()