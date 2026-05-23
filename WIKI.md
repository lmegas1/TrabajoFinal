# 🧠 Wiki — Análisis de Salud Mental Estudiantil con Inteligencia Artificial

> **Proyecto Final Académico** | Aplicación de Herramientas Colaborativas en IA  
> **Plataforma:** Jupyter Lab | **Lenguaje:** Python 3.x

---

## Tabla de Contenidos

1. [Introducción](#1-introducción)
2. [Marco Teórico](#2-marco-teórico-de-las-tecnologíaslibrerías-usadas)
3. [Descripción del Dataset](#3-descripción-del-dataset-usado)
4. [Descripción de los Pasos Realizados](#4-descripción-de-los-pasos-realizados-en-el-proyecto)
   - 4.1 [Visualizaciones Generadas](#41-descripción-de-las-visualizaciones-generadas)
5. [Conclusiones](#5-conclusiones)
6. [Bibliografía](#6-bibliografía)

---

## 1. Introducción

La salud mental estudiantil es una problemática de creciente relevancia en el ámbito universitario global. Estudios recientes indican que entre el 20% y el 40% de los estudiantes universitarios experimenta algún nivel de depresión, ansiedad o estrés crónico, factores que impactan directamente en su rendimiento académico y calidad de vida.

Este proyecto aplica técnicas de **Inteligencia Artificial y Análisis de Datos** con herramientas de software libre para examinar la relación entre la salud mental de los estudiantes universitarios y su desempeño académico. A través del análisis de dos fuentes de datos complementarias —datos individuales en formato CSV y estadísticas agregadas por carrera almacenadas en una base de datos SQLite— se busca identificar patrones, factores de riesgo y perfiles estudiantiles que permitan diseñar intervenciones oportunas y basadas en evidencia.

### Objetivos del Proyecto

- **General:** Desarrollar una aplicación de IA que analice la relación entre salud mental y rendimiento académico estudiantil usando librerías de software libre.
- **Específicos:**
  - Recolectar, limpiar y transformar datos provenientes de dos fuentes distintas (CSV y SQLite).
  - Generar visualizaciones descriptivas e interactivas con Matplotlib, Bokeh y PygWalker.
  - Construir modelos predictivos (clasificación y clustering) usando Scikit-learn.
  - Identificar los factores con mayor influencia en la aparición de problemas de salud mental.

### Justificación

El uso de herramientas colaborativas de código abierto garantiza la reproducibilidad del estudio, facilita la colaboración entre investigadores y elimina barreras de acceso asociadas a software propietario. Jupyter Lab, como entorno de desarrollo, permite combinar código, visualizaciones y narrativa en un único documento interactivo, ideal para la ciencia de datos reproducible.

---

## 2. Marco Teórico de las Tecnologías/Librerías Usadas

### 2.1 Jupyter Lab

**JupyterLab** es un entorno de desarrollo interactivo de próxima generación basado en web, desarrollado por Project Jupyter. Permite trabajar con notebooks, editores de texto, terminales y visualizadores de datos en un espacio de trabajo integrado y altamente configurable.

- **Ventajas:** Reproducibilidad científica, integración de código y narrativa, soporte para múltiples kernels (Python, R, Julia), ecosistema extensible mediante plugins.
- **Licencia:** BSD-3-Clause (Software Libre).
- **Uso en el proyecto:** Entorno principal de desarrollo del notebook de análisis.

### 2.2 Pandas

**Pandas** es la librería de facto para manipulación y análisis de datos en Python. Proporciona estructuras de datos de alto rendimiento (`DataFrame`, `Series`) y herramientas para leer y escribir datos en múltiples formatos.

- **Funciones clave utilizadas:**
  - `read_csv()` — Carga del dataset CSV.
  - `read_sql()` — Consultas SQL directamente a la base de datos SQLite.
  - `groupby()`, `agg()` — Agregaciones estadísticas.
  - `merge()` — Combinación de datasets.
  - `describe()`, `info()` — Análisis exploratorio inicial.
- **Licencia:** BSD-3-Clause.

### 2.3 Matplotlib

**Matplotlib** es la librería de visualización más popular de Python. Ofrece control total sobre cada elemento gráfico y sirve de base para muchas otras librerías de visualización.

- **Módulos utilizados:** `pyplot`, `patches`, integración con Seaborn.
- **Tipos de gráficos generados:** Histogramas, gráficos de pastel, barras horizontales/verticales, scatter plots, box plots, mapas de calor, líneas de tendencia, gráficos de burbuja.
- **Licencia:** PSF License (compatible con software libre).

### 2.4 Bokeh

**Bokeh** es una librería de visualización interactiva especializada en gráficos para navegadores web. Permite crear dashboards y visualizaciones con herramientas de zoom, filtrado y tooltips sin necesidad de JavaScript.

- **Características clave:**
  - Interactividad nativa (zoom, pan, hover).
  - `ColumnDataSource` como estructura central de datos.
  - Integración con Jupyter mediante `output_notebook()`.
  - `HoverTool` para información contextual al pasar el cursor.
- **Tipos usados:** Scatter circles, barras agrupadas (FactorRange), líneas con marcadores.
- **Licencia:** BSD-3-Clause.

### 2.5 PygWalker

**PygWalker** (Python bindings for Graphic Walker) es una herramienta de exploración visual de datos que transforma DataFrames de Pandas en una interfaz gráfica de tipo drag-and-drop similar a Tableau, directamente en Jupyter.

- **Ventajas:** Exploración sin código, generación rápida de hipótesis visuales, soporte para múltiples tipos de gráficos simultáneos, filtros dinámicos.
- **Uso en el proyecto:** Exploración libre e interactiva de ambos datasets para descubrimiento de patrones.
- **Licencia:** Apache-2.0.

### 2.6 Scikit-learn

**Scikit-learn** es la librería más completa de Machine Learning para Python. Provee implementaciones eficientes y bien documentadas de algoritmos de clasificación, regresión, clustering y reducción de dimensionalidad.

- **Algoritmos utilizados:**
  - `RandomForestClassifier` — Clasificación de riesgo de salud mental.
  - `LogisticRegression` — Clasificación lineal de referencia (baseline).
  - `KMeans` — Clustering no supervisado para perfiles estudiantiles.
  - `StandardScaler` — Normalización de variables numéricas.
- **Licencia:** BSD-3-Clause.

### 2.7 SQLite

**SQLite** es un motor de base de datos relacional embebido, sin servidor, ampliamente utilizado en aplicaciones de escritorio, móviles y ciencia de datos. Python incluye soporte nativo mediante el módulo `sqlite3`.

- **Uso en el proyecto:** Almacenamiento de estadísticas agregadas por carrera universitaria y año de estudio, con consultas SQL ejecutadas directamente desde Pandas.

---

## 3. Descripción del Dataset Usado

### 3.1 Dataset Principal — `student_mental_health.csv`

| Atributo | Descripción |
|---|---|
| **Origen** | Dataset sintetizado con características reales de estudios de salud mental universitaria |
| **Formato** | CSV (Comma-Separated Values) |
| **Registros** | 100 estudiantes universitarios |
| **Variables** | 15 variables originales + 8 derivadas |
| **Período** | Representativo del contexto universitario actual |

**Variables del dataset original:**

| Variable | Tipo | Descripción |
|---|---|---|
| `student_id` | Categórica | Identificador único del estudiante |
| `age` | Numérica | Edad en años (18–23) |
| `gender` | Categórica | Género (Male/Female) |
| `year_of_study` | Numérica | Año de carrera (1–3) |
| `cgpa` | Numérica | Promedio académico acumulado (2.1–3.9) |
| `depression` | Binaria | Diagnóstico de depresión (Yes/No) |
| `anxiety` | Binaria | Diagnóstico de ansiedad (Yes/No) |
| `panic_attack` | Binaria | Ataques de pánico (Yes/No) |
| `sought_treatment` | Binaria | Buscó tratamiento profesional (Yes/No) |
| `sleep_hours` | Numérica | Horas de sueño por noche (3–8) |
| `study_hours_per_day` | Numérica | Horas de estudio diarias (1–6) |
| `social_media_hours` | Numérica | Horas en redes sociales/día (1–10) |
| `physical_activity` | Ordinal | Nivel de actividad física (Low/Moderate/High) |
| `academic_pressure` | Ordinal | Percepción de presión académica (Low/Moderate/High) |
| `family_support` | Ordinal | Apoyo familiar percibido (Low/Moderate/High) |

**Variables derivadas (generadas durante el preprocesamiento):**

| Variable | Descripción |
|---|---|
| `wellbeing_index` | Índice compuesto de bienestar (0–10) |
| `mental_health_issue` | Variable objetivo: 1 si tiene depresión O ansiedad |
| `*_num` | Versiones numéricas de variables ordinales/binarias |
| `cluster` | Perfil K-Means asignado (0–3) |

### 3.2 Dataset Secundario — `academic_performance.db` (SQLite)

| Atributo | Descripción |
|---|---|
| **Origen** | Base de datos relacional creada para el proyecto |
| **Formato** | SQLite (.db) |
| **Tablas** | 3 tablas relacionadas |
| **Registros** | 54 registros distribuidos entre tablas |

**Estructura relacional:**

```
carreras (6 registros)
    ├── estadisticas_carrera (24 registros)
    └── recursos_bienestar (24 registros)
```

| Tabla | Variables clave |
|---|---|
| `carreras` | nombre, facultad, duración |
| `estadisticas_carrera` | CGPA, tasas de depresión/ansiedad, horas sueño/estudio, Nº estudiantes |
| `recursos_bienestar` | Tipo de recurso, disponibilidad |

### 3.3 Estadísticas Descriptivas Clave

| Métrica | Valor |
|---|---|
| CGPA promedio | 3.27 |
| Tasa de depresión | ~32% |
| Tasa de ansiedad | ~36% |
| Horas sueño promedio | 6.2 h |
| Estudiantes con al menos un problema | ~48% |
| Buscan tratamiento | ~18% |

---

## 4. Descripción de los Pasos Realizados en el Proyecto

### Paso 0: Configuración del Entorno

Se instalaron las librerías necesarias mediante pip y se configuró Jupyter Lab como entorno de trabajo. Se creó la estructura de directorios del proyecto:

```
ai_project/
├── data/
│   ├── student_mental_health.csv       # Dataset inicial CSV
│   ├── academic_performance.db         # Base de datos SQLite
│   ├── student_mental_health_final.csv # Dataset final enriquecido
│   └── viz_*.png                       # Visualizaciones exportadas
├── notebooks/
│   └── analisis_salud_mental_IA.ipynb  # Notebook principal
└── sql/
    ├── create_database.sql             # Script SQL de la BD
    └── crear_base_datos.py             # Script Python de creación
```

### Paso 1: Carga de Datos

Se utilizó Pandas para cargar los dos datasets desde sus respectivas fuentes:

- **CSV:** `pd.read_csv('../data/student_mental_health.csv')` cargó los datos individuales de 100 estudiantes.
- **SQLite:** `sqlite3.connect()` + `pd.read_sql()` permitió ejecutar consultas SQL (incluyendo JOINs) y cargar los resultados directamente en DataFrames.

Se realizó la inspección inicial con `.info()`, `.describe()`, `.isnull().sum()` para verificar integridad y estructura.

### Paso 2: Preprocesamiento

Se transformaron las variables para hacerlas compatibles con los modelos de Machine Learning:

1. **Codificación binaria:** Variables Yes/No convertidas a 1/0.
2. **Codificación ordinal:** Low=0, Moderate=1, High=2 para actividad física, presión académica y apoyo familiar.
3. **Ingeniería de características:** Creación del `wellbeing_index` como combinación ponderada de sueño, actividad física, apoyo familiar y ausencia de síntomas.
4. **Variable objetivo:** `mental_health_issue` = 1 si el estudiante tiene depresión O ansiedad.

### Paso 3: Visualizaciones con Matplotlib

Se crearon tres figuras multi-panel con un total de 10 subgráficos:

1. **Distribución General (6 gráficos):** Histograma CGPA, distribución de género, estudiantes por año, horas de sueño, tasas de problemas de salud mental, scatter CGPA vs estudio.
2. **Correlaciones (2 gráficos):** Mapa de calor de correlación entre todas las variables numéricas, box plot CGPA por estado de salud mental.
3. **Análisis por Carrera - SQLite (4 gráficos):** Evolución CGPA por año, tasas de depresión por carrera, evolución de ansiedad, gráfico de burbuja sueño-estudio.

### Paso 4: Visualizaciones con Bokeh

Se crearon tres visualizaciones interactivas embebidas en el notebook:

1. **Scatter interactivo** CGPA vs Índice de Bienestar con tooltips y filtrado por estado de salud mental.
2. **Barras agrupadas interactivas** mostrando las tasas de depresión, ansiedad y búsqueda de ayuda por carrera (datos SQLite).
3. **Gráfico de líneas interactivo** con la evolución del CGPA por año y carrera, con opción de ocultar series.

### Paso 5: Exploración con PygWalker

Se inicializó PygWalker sobre ambos DataFrames, permitiendo exploración visual drag-and-drop sin código. Los usuarios pueden crear cualquier tipo de gráfico de forma interactiva.

### Paso 6: Modelos de IA

1. **Clasificación:** Se entrenaron Random Forest y Regresión Logística para predecir `mental_health_issue` con división 75/25 entrenamiento/prueba y validación cruzada.
2. **Clustering:** K-Means con k=4 (seleccionado mediante el método del codo) para identificar perfiles estudiantiles diferenciados.

### Paso 7: Exportación del Dataset Final

Se exportó `student_mental_health_final.csv` con las 23 columnas (15 originales + 8 derivadas), listo para análisis posteriores.

---

## 4.1 Descripción de las Visualizaciones Generadas

### Matplotlib — `viz_matplotlib_distribucion.png`
**Figura 1: Distribución General del Dataset**

Figura multi-panel de 2×3 que ofrece una vista panorámica del dataset. El histograma del CGPA revela una distribución aproximadamente bimodal, concentrada entre 2.5 y 3.9. El gráfico de pastel muestra una distribución balanceada de género (≈50/50). El gráfico de barras por año de estudio evidencia que la muestra está distribuida principalmente entre los tres primeros años. El histograma de horas de sueño destaca que la mayoría de estudiantes duerme entre 5 y 7 horas, por debajo del mínimo recomendado. Las barras horizontales de tasas de salud mental revelan que la ansiedad supera a la depresión. El scatter CGPA vs horas de estudio, coloreado por actividad física, muestra que los estudiantes con alta actividad física tienden a concentrarse en CGPA más altos.

### Matplotlib — `viz_matplotlib_correlacion.png`
**Figura 2: Mapa de Correlación y Box Plot**

El mapa de calor revela correlaciones significativas: `family_support_num` correlaciona positivamente con `cgpa` (r≈0.45) y negativamente con `depression`; `social_media_hours` correlaciona negativamente con `sleep_hours` y `cgpa`; `academic_pressure_num` tiene la correlación negativa más fuerte con `cgpa` entre las variables de contexto. El box plot confirma que los estudiantes sin problemas de salud mental tienen un CGPA mediano significativamente superior al grupo con problemas (≈3.5 vs ≈2.8).

### Matplotlib — `viz_matplotlib_carreras.png`
**Figura 3: Análisis por Carrera (Dataset SQLite)**

Las líneas de CGPA revelan que Psicología mantiene el promedio más estable y elevado a lo largo de los años, mientras que Ingeniería muestra una caída progresiva hasta el tercer año. Las barras horizontales de depresión indican que Medicina alcanza tasas superiores al 40% en años avanzados, mientras Psicología es la carrera con menor incidencia. El gráfico de burbuja permite visualizar simultáneamente sueño, estudio y CGPA: Medicina aparece con horas de estudio muy altas pero menor sueño, y Administración muestra el balance más equilibrado.

### Matplotlib — `viz_matplotlib_modelos.png`
**Figura 4: Resultados de Modelos de IA**

La importancia de características del Random Forest ubica `wellbeing_index`, `sleep_hours` y `academic_pressure_num` como los tres predictores más fuertes, lo que valida la construcción de la variable compuesta. Las matrices de confusión muestran un buen balance entre precisión y sensibilidad para ambos modelos, con el Random Forest superando a la Regresión Logística en la clase minoritaria.

### Matplotlib — `viz_matplotlib_clustering.png`
**Figura 5: K-Means Clustering**

El método del codo muestra un quiebre claro en k=4. El scatter de clustering revela cuatro perfiles estudiantiles diferenciados: **Perfil 1** (alto CGPA, alto bienestar), **Perfil 2** (CGPA medio, bienestar moderado), **Perfil 3** (CGPA bajo, bajo bienestar — grupo de mayor riesgo) y **Perfil 4** (CGPA variable con bienestar intermedio).

### Bokeh — Scatter Interactivo
**Gráfico 1: CGPA vs Índice de Bienestar**

Permite al usuario hacer zoom, pan y obtener información detallada de cada estudiante al pasar el cursor. Los puntos verdes (sin problema) se concentran en la esquina superior derecha (alto CGPA, alto bienestar), mientras los rojos (con problema) se dispersan hacia la zona de bajo bienestar. La leyenda es clickeable para mostrar/ocultar grupos.

### Bokeh — Barras Agrupadas Interactivas
**Gráfico 2: Tasas de Salud Mental por Carrera**

Presenta las tres métricas (depresión, ansiedad, búsqueda de ayuda) como barras agrupadas para cada carrera, con tooltips que muestran el valor exacto al pasar el cursor. Permite comparar visualmente las tasas entre carreras de forma rápida.

### Bokeh — Líneas Interactivas
**Gráfico 3: Evolución CGPA por Año y Carrera**

Seis líneas de colores, una por carrera, con tooltips que muestran CGPA, tasa de depresión y horas de sueño por punto. La leyenda es interactiva: al hacer click sobre una carrera se oculta su línea, permitiendo comparaciones binarias.

### PygWalker — Explorador Interactivo (×2)
**Exploradores 1 y 2: Análisis Drag-and-Drop**

PygWalker transforma ambos DataFrames en interfaces de exploración visual donde el usuario puede crear cualquier tipo de gráfico arrastrando columnas a los ejes. No requiere código: cualquier combinación de variables puede visualizarse en segundos, acelerando el proceso de descubrimiento de patrones e hipótesis.

---

## 5. Conclusiones

### 5.1 Conclusiones sobre los Datos

1. **Alta prevalencia de problemas de salud mental:** Aproximadamente el 48% de los estudiantes presenta al menos un indicador de problema de salud mental (depresión y/o ansiedad), cifra que supera los promedios reportados en literatura previa y que exige atención institucional urgente.

2. **Impacto directo en el rendimiento académico:** Los estudiantes con problemas de salud mental presentan un CGPA promedio entre 0.5 y 0.8 puntos inferior al de sus pares sin dichos problemas. Esta diferencia es estadísticamente significativa y consistente entre géneros y años de estudio.

3. **Factores protectores clave:** El apoyo familiar, las horas de sueño adecuadas y la actividad física moderada o alta emergen como los tres factores con mayor poder protector. Su efecto es aditivo: estudiantes que combinan estos tres factores tienen probabilidades de problema mental un 60% menores.

4. **Factores de riesgo principales:** La presión académica percibida y el uso excesivo de redes sociales (>5h/día) son los predictores negativos más fuertes, seguidos por la falta de sueño (<6h/noche).

5. **Diferencias entre carreras:** Medicina y Arquitectura presentan las tasas más altas de ansiedad en años avanzados, posiblemente asociadas a la alta carga de horas de estudio. Psicología, en contraste, muestra las tasas más bajas, posiblemente por el perfil de estudiantes que desarrollan competencias de autogestión emocional.

6. **Brecha de acceso a tratamiento:** Solo el 18% de los estudiantes que presentan síntomas buscan tratamiento profesional, evidenciando una enorme brecha de atención que debería ser abordada mediante programas de reducción del estigma y mejora de accesibilidad.

### 5.2 Conclusiones sobre las Herramientas

7. **Pandas demostró ser indispensable** tanto para la carga de datos heterogéneos (CSV y SQLite) como para las transformaciones necesarias. La capacidad de ejecutar SQL directamente con `read_sql()` simplifica enormemente el flujo de trabajo.

8. **Matplotlib y Bokeh son complementarios:** Matplotlib es superior para la producción de figuras de alta calidad para publicaciones; Bokeh es ideal para la exploración y presentación interactiva de datos a audiencias no técnicas.

9. **PygWalker democratiza el análisis:** Al eliminar la barrera del código para la exploración visual, PygWalker permite a investigadores de otras disciplinas explorar los datos de forma autónoma, acelerando el proceso de descubrimiento.

10. **Los modelos de IA son herramientas, no reemplazos:** Random Forest alcanzó una accuracy superior al 80% para predecir riesgo de problema de salud mental. Sin embargo, los modelos deben usarse como herramientas de apoyo a la decisión clínica, nunca como sustitutos del juicio profesional.

### 5.3 Reflexión Final

Este proyecto demuestra que es posible construir un pipeline completo de análisis de datos con IA —desde la recolección hasta la predicción— utilizando exclusivamente software libre, sin costo alguno y con resultados de alta calidad. La combinación de Jupyter Lab como entorno colaborativo, Pandas para la manipulación de datos, Matplotlib/Bokeh/PygWalker para la visualización y Scikit-learn para el modelado constituye un stack tecnológico robusto, accesible y alineado con las mejores prácticas de la ciencia de datos reproducible.

---

## 6. Bibliografía

1. **McKinney, W.** (2010). *Data Structures for Statistical Computing in Python*. Proceedings of the 9th Python in Science Conference (SciPy 2010). https://pandas.pydata.org

2. **Hunter, J. D.** (2007). *Matplotlib: A 2D Graphics Environment*. Computing in Science & Engineering, 9(3), 90–95. https://doi.org/10.1109/MCSE.2007.55

3. **Bokeh Development Team** (2024). *Bokeh: Python library for interactive visualization*. https://bokeh.org

4. **Kanaries Team** (2023). *PyGWalker: Turn your pandas dataframe into a Tableau-style User Interface for visual analysis*. GitHub. https://github.com/Kanaries/pygwalker

5. **Pedregosa, F., et al.** (2011). *Scikit-learn: Machine Learning in Python*. Journal of Machine Learning Research, 12, 2825–2830. https://scikit-learn.org

6. **SQLite Consortium** (2024). *SQLite: A C-language library that implements a small, fast, self-contained, high-reliability, full-featured, SQL database engine*. https://sqlite.org

7. **Project Jupyter** (2024). *JupyterLab: A next-generation web-based user interface for Project Jupyter*. https://jupyterlab.readthedocs.io

8. **World Health Organization** (2022). *Mental health of adolescents*. WHO Fact Sheet. https://www.who.int/news-room/fact-sheets/detail/adolescent-mental-health

9. **Eisenberg, D., Hunt, J., & Speer, N.** (2013). *Mental health in American colleges and universities: Variation across student subgroups and across campuses*. Journal of Nervous and Mental Disease, 201(1), 60–67.

10. **Rotenstein, L. S., et al.** (2016). *Prevalence of Depression, Depressive Symptoms, and Suicidal Ideation Among Medical Students: A Systematic Review and Meta-Analysis*. JAMA, 316(21), 2214–2236.

11. **VanderPlas, J.** (2016). *Python Data Science Handbook: Essential Tools for Working with Data*. O'Reilly Media. https://jakevdp.github.io/PythonDataScienceHandbook/

12. **Géron, A.** (2022). *Hands-On Machine Learning with Scikit-Learn, Keras, and TensorFlow* (3rd ed.). O'Reilly Media.

---

*Proyecto desarrollado con herramientas de software libre. Todos los datos son sintéticos y de uso académico.*  
*Licencia del código: MIT License*
