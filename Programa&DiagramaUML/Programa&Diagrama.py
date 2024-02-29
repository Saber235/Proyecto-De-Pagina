# -*- coding: utf-8 -*-
"""
Created on Tue Feb 13 08:10:24 2024

@author:Jhonny Torres "__________"
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

# Solicitar al usuario los datos para el cuadrado
lado_cuadrado = float(input("Ingrese el lado del cuadrado: "))
cuadrado = Cuadrado(lado_cuadrado)
print("Área del cuadrado:", cuadrado.calcular_area())
print("Perímetro del cuadrado:", cuadrado.calcular_perimetro())

# Solicitar al usuario los datos para el círculo
radio_circulo = float(input("Ingrese el radio del círculo: "))
circulo = Circulo(radio_circulo)
print("Área del círculo:", circulo.calcular_area())
print("Perímetro del círculo:", circulo.calcular_perimetro())

# Solicitar al usuario los datos para el rectángulo
base_rectangulo = float(input("Ingrese la base del rectángulo: "))
altura_rectangulo = float(input("Ingrese la altura del rectángulo: "))
rectangulo = Rectangulo(base_rectangulo, altura_rectangulo)
print("Área del rectángulo:", rectangulo.calcular_area())
print("Perímetro del rectángulo:", rectangulo.calcular_perimetro())

# Solicitar al usuario los datos para el triángulo
base_triangulo = float(input("Ingrese la base del triángulo: "))
altura_triangulo = float(input("Ingrese la altura del triángulo: "))
lado1_triangulo = float(input("Ingrese el lado 1 del triángulo: "))
lado2_triangulo = float(input("Ingrese el lado 2 del triángulo: "))
lado3_triangulo = float(input("Ingrese el lado 3 del triángulo: "))
triangulo = Triangulo(base_triangulo, altura_triangulo, lado1_triangulo, lado2_triangulo, lado3_triangulo)
print("Área del triángulo:", triangulo.calcular_area())
print("Perímetro del triángulo:", triangulo.calcular_perimetro())
