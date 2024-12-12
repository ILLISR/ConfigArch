#!/usr/bin/env python3
import time
import os
import signal
import sys

# Archivo donde se guarda el tiempo acumulado
archivo_tiempo = "tiempo_acumulado.txt"

def leer_tiempo_acumulado():
    if os.path.exists(archivo_tiempo):
        with open(archivo_tiempo, "r") as file:
            try:
                tiempo_str = file.read().strip()
                horas, minutos, segundos = map(int, tiempo_str.split(":"))
                return horas * 3600 + minutos * 60 + segundos  # Convertir a segundos
            except ValueError:
                return 0
    return 0

def guardar_tiempo_acumulado(tiempo_en_segundos):
    horas, resto = divmod(tiempo_en_segundos, 3600)  # Obtener horas y resto en segundos
    minutos, segundos = divmod(resto, 60)            # Obtener minutos y segundos
    with open(archivo_tiempo, "w") as file:
        file.write(f"{int(horas):02}:{int(minutos):02}:{int(segundos):02}")

def formatear_tiempo(tiempo_en_segundos):
    horas, resto = divmod(tiempo_en_segundos, 3600)
    minutos, segundos = divmod(resto, 60)
    return f"{int(horas):02}:{int(minutos):02}:{int(segundos):02}"

# Manejar señales del sistema
def manejar_senal(signum, frame):
    fin = time.time()
    tiempo_final = tiempo_acumulado + (fin - inicio)
    guardar_tiempo_acumulado(tiempo_final)
    print(f"\nTiempo guardado antes de cerrar: {formatear_tiempo(tiempo_final)}")
    sys.exit(0)

# Capturar señales SIGTERM y SIGHUP
signal.signal(signal.SIGTERM, manejar_senal)
signal.signal(signal.SIGHUP, manejar_senal)

# Función principal para simular el reloj
def reloj():
    global tiempo_acumulado, inicio
    tiempo_acumulado = leer_tiempo_acumulado()
    print(f"Tiempo acumulado inicial: {formatear_tiempo(tiempo_acumulado)}")
    
    inicio = time.time()  # Marca el inicio del tiempo
    try:
        while True:
            ahora = time.time()
            tiempo_total = tiempo_acumulado + (ahora - inicio)
            print(f"Tiempo total: {formatear_tiempo(tiempo_total)}", end="\r")
            time.sleep(1)
    except KeyboardInterrupt:
        manejar_senal(None, None)

if __name__ == "__main__":
    reloj()

