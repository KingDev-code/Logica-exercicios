class RegMedida:
    def __init__(self):
        self.dia = 0
        self.mes = 0
        self.altura = 0.0
        self.peso = 0.0
        self.cintura = 0.0
        self.abdomen = 0.0
        self.quadril = 0.0

def main():
    medidas = RegMedida()

    # Abre o arquivo para gravação
    with open('medidas.txt', 'w') as arquivo:
        medidas.dia = int(input("Digite o dia da medida: "))
        medidas.mes = int(input("Digite o mês da medida: "))
        medidas.altura = float(input("Digite a altura em metros: "))
        medidas.peso = float(input("Digite o peso em kg: "))
        medidas.cintura = float(input("Digite a medida da cintura em cm: "))
        medidas.abdomen = float(input("Digite a medida do abdômen em cm: "))
        medidas.quadril = float(input("Digite a medida do quadril em cm: "))

        # Guarda a medida no arquivo
        arquivo.write(f"{medidas.dia},{medidas.mes},{medidas.altura},{medidas.peso},{medidas.cintura},{medidas.abdomen},{medidas.quadril}\n")

    print("Medida gravada com sucesso!")

if __name__ == "__main__":
    main()
