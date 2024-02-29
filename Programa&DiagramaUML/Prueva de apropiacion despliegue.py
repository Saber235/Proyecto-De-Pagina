# -*- coding: utf-8 -*-
"""
Created on Thu Feb 29 10:41:59 2024

@author: FORMACION
"""

import math

# Clase base para figuras geométricas
class FiguraGeometrica:
    def calcular_area(self):
        pass
    
    def calcular_perimetro(self):
        pass

# Clase para representar un cuadrado
class Cuadrado(FiguraGeometrica):
    def __init__(self, lado):
        self.__lado = lado
    
    def calcular_area(self):
        return self.__lado ** 2
    
    def calcular_perimetro(self):
        return 4 * self.__lado

# Clase para representar un círculo
class Circulo(FiguraGeometrica):
    def __init__(self, radio):
        self.__radio = radio
    
    def calcular_area(self):
        return math.pi * self.__radio ** 2
    
    def calcular_perimetro(self):
        return 2 * math.pi * self.__radio

# Clase para representar un rectángulo
class Rectangulo(FiguraGeometrica):
    def __init__(self, base, altura):
        self.__base = base
        self.__altura = altura
    
    def calcular_area(self):
        return self.__base * self.__altura
    
    def calcular_perimetro(self):
        return 2 * (self.__base + self.__altura)

# Clase para representar un triángulo
class Triangulo(FiguraGeometrica):
    def __init__(self, base, altura, lado1, lado2, lado3):
        self.__base = base
        self.__altura = altura
        self.__lado1 = lado1
        self.__lado2 = lado2
        self.__lado3 = lado3
    
    def calcular_area(self):
        return (self.__base * self.__altura) / 2
    
    def calcular_perimetro(self):
        return self.__lado1 + self.__lado2 + self.__lado3

while True:
    # Mostrar opciones al usuario
    print("1. Cuadrado")
    print("2. Círculo")
    print("3. Rectángulo")
    print("4. Triángulo")
    print("5. Salir")

    figuras = [Cuadrado, Circulo, Rectangulo, Triangulo]

for Figura in figuras:
    # Mostrar nombre de la figura
    print(f"Figura: {Figura.__name__}")

    # Solicitar datos y calcular área y perímetro
    if Figura == Cuadrado:
        lado_cuadrado = float(input("Ingrese el lado del cuadrado: "))
        figura = Figura(lado_cuadrado)
    elif Figura == Circulo:
        radio_circulo = float(input("Ingrese el radio del círculo: "))
        figura = Figura(radio_circulo)
    elif Figura == Rectangulo:
        base_rectangulo = float(input("Ingrese la base del rectángulo: "))
        altura_rectangulo = float(input("Ingrese la altura del rectángulo: "))
        figura = Figura(base_rectangulo, altura_rectangulo)
    elif Figura == Triangulo:
        base_triangulo = float(input("Ingrese la base del triángulo: "))
        altura_triangulo = float(input("Ingrese la altura del triángulo: "))
        lado1_triangulo = float(input("Ingrese el lado 1 del triángulo: "))
        lado2_triangulo = float(input("Ingrese el lado 2 del triángulo: "))
        lado3_triangulo = float(input("Ingrese el lado 3 del triángulo: "))
        figura = Figura(base_triangulo, altura_triangulo, lado1_triangulo, lado2_triangulo, lado3_triangulo)

    print("Área:", figura.calcular_area())
    print("Perímetro:", figura.calcular_perimetro())

print("Fin del ciclo")