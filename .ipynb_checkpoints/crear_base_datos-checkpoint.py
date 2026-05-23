"""
Script: crear_base_datos.py
Descripción: Genera la base de datos SQLite a partir del archivo SQL
Proyecto: Análisis de Salud Mental Estudiantil con IA
"""

import sqlite3
import os

# Ruta de la base de datos y el SQL
DB_PATH  = "../data/academic_performance.db"
SQL_PATH = "create_database.sql"

def crear_base_datos():
    # Eliminar DB previa si existe
    if os.path.exists(DB_PATH):
        os.remove(DB_PATH)
        print(f"Base de datos anterior eliminada: {DB_PATH}")

    # Leer el script SQL
    with open(SQL_PATH, "r", encoding="utf-8") as f:
        sql_script = f.read()

    # Conectar y ejecutar
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    cursor.executescript(sql_script)
    conn.commit()

    # Verificar tablas creadas
    cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
    tablas = cursor.fetchall()
    print("\n✅ Base de datos creada exitosamente.")
    print("Tablas generadas:")
    for tabla in tablas:
        cursor.execute(f"SELECT COUNT(*) FROM {tabla[0]}")
        count = cursor.fetchone()[0]
        print(f"  - {tabla[0]}: {count} registros")

    conn.close()
    print(f"\n📁 Archivo guardado en: {os.path.abspath(DB_PATH)}")

if __name__ == "__main__":
    crear_base_datos()
