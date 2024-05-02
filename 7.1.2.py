class RegMedida:
    def __init__(self, dia=0, mes=0, altura=0.0, peso=0.0, cintura=0.0, abdomen=0.0, quadril=0.0):
        self.dia = dia
        self.mes = mes
        self.altura = altura
        self.peso = peso
        self.cintura = cintura
        self.abdomen = abdomen
        self.quadril = quadril

def main():
    medidas = []

    # Abre o arquivo para leitura
    with open('medidas.txt', 'r') as arquivo:
        linhas = arquivo.readlines()

        # Lê a primeira medição
        primeira_medida = linhas[0].strip().split(',')
        peso1 = float(primeira_medida[3])
        IMC1 = peso1 / (float(primeira_medida[2]) ** 2)
        rCinQua1 = float(primeira_medida[4]) / float(primeira_medida[6])

        print("Primeira medição:")
        print(f"Altura: {primeira_medida[2]}")
        print(f"Peso: {peso1}")
        print(f"IMC: {IMC1}")
        print(f"Relação Cintura-Quadril: {rCinQua1}")

        medidas.append((float(primeira_medida[2]), peso1, IMC1, rCinQua1))

        # Lê as demais medições
        for linha in linhas[1:]:
            medida = linha.strip().split(',')
            peso2 = float(medida[3])
            difPeso = peso2 - peso1
            IMC2 = peso2 / (float(medida[2]) ** 2)
            difIMC = IMC2 - IMC1
            rCinQua2 = float(medida[4]) / float(medida[6])
            difCinQua = rCinQua2 - rCinQua1

            print("\nMedição:")
            print(f"Altura: {medida[2]}")
            print(f"Peso: {peso2}")
            print(f"Diferença de Peso: {difPeso}")
            print(f"IMC: {IMC2}")
            print(f"Diferença de IMC: {difIMC}")
            print(f"Relação Cintura-Quadril: {rCinQua2}")
            print(f"Diferença de Relação Cintura-Quadril: {difCinQua}")

            medidas.append((float(medida[2]), peso2, difPeso, IMC2, difIMC, rCinQua2, difCinQua))
            peso1 = peso2
            IMC1 = IMC2
            rCinQua1 = rCinQua2

    print("\nMedições armazenadas:")
    for medida in medidas:
        print(medida)

if __name__ == "__main__":
    main()
