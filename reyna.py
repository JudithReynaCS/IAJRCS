def es_seguro(tablero, fila, columna):
    # Verifica si hay una reina en la misma columna
    for i in range(fila):
        if tablero[i] == columna or \
           tablero[i] == columna - (fila - i) or \
           tablero[i] == columna + (fila - i):
            return False
    return True

def resolver_reinas_util(tablero, fila):
    # Caso base: todas las reinas están colocadas
    if fila >= 8:
        return True
    
    # Coloca esta reina en esta fila
    for columna in range(8):
        if es_seguro(tablero, fila, columna):
            tablero[fila] = columna
            
            
            if resolver_reinas_util(tablero, fila + 1):
                return True
            
        
            tablero[fila] = -1
    
    
    return False

def resolver_reinas():
    
    tablero = [-1] * 8
    
    if not resolver_reinas_util(tablero, 0):
        print("No hay solución para el problema de las 8 reinas.")
        return
    
    # Imprime el tablero solución
    print("Solución:")
    for fila in range(8):
        line = ""
        for columna in range(8):
            if tablero[fila] == columna:
                line += "Q "
            else:
                line += ". "
        print(line)
resolver_reinas()
