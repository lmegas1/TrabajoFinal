# 🧠 Análisis de Salud Mental Estudiantil con IA

[![Python](https://img.shields.io/badge/Python-3.x-blue?logo=python)](https://python.org)
[![Jupyter](https://img.shields.io/badge/Jupyter-Lab-orange?logo=jupyter)](https://jupyter.org)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)
[![Pandas](https://img.shields.io/badge/Pandas-2.x-150458?logo=pandas)](https://pandas.pydata.org)
[![Bokeh](https://img.shields.io/badge/Bokeh-3.x-grey)](https://bokeh.org)

> Proyecto Final Académico — Aplicación de IA con librerías de software libre a través de herramientas colaborativas.

## 📁 Estructura del Repositorio

```
├── data/
│   ├── student_mental_health.csv        # Dataset inicial (CSV)
│   ├── academic_performance.db          # Base de datos SQLite
│   └── student_mental_health_final.csv  # Dataset final enriquecido
├── notebooks/
│   └── analisis_salud_mental_IA.ipynb   # Notebook principal
├── sql/
│   ├── create_database.sql              # Script SQL de la BD
│   └── crear_base_datos.py              # Script Python de creación
├── WIKI.md                              # Informe completo del proyecto
└── README.md
```

## 🚀 Cómo Ejecutar

```bash
# 1. Clonar el repositorio
git clone https://github.com/tu-usuario/ai-salud-mental.git
cd ai-salud-mental

# 2. Instalar dependencias
pip install pandas numpy matplotlib seaborn bokeh pygwalker scikit-learn jupyter

# 3. Crear la base de datos SQLite
cd sql && python crear_base_datos.py && cd ..

# 4. Abrir Jupyter Lab
jupyter lab notebooks/analisis_salud_mental_IA.ipynb
```

## 📊 Tecnologías Usadas

| Librería | Uso |
|---|---|
| **Pandas** | Carga y manipulación de datos (CSV + SQLite) |
| **Matplotlib + Seaborn** | Visualizaciones estáticas |
| **Bokeh** | Visualizaciones interactivas |
| **PygWalker** | Exploración drag-and-drop |
| **Scikit-learn** | Random Forest, Regresión Logística, K-Means |
| **SQLite** | Base de datos relacional embebida |

## 📖 Wiki

Consulta la [Wiki completa](WIKI.md) para el informe académico detallado que incluye:
- Marco teórico de cada librería
- Descripción de los datasets
- Pasos del proyecto y descripción de visualizaciones
- Conclusiones y bibliografía
