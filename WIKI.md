# 🧠 Wiki — Análisis de Salud Mental Estudiantil con Inteligencia Artificial

> **Trabajo Final** | Aplicación de IA que use librerías de software libre a través de herramientas colaborativas  
> **Plataforma:** Jupyter Lab | **Lenguaje:** Python

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

Este proyecto aplica técnicas de **Inteligencia Artificial y Análisis de Datos** con herramientas de software libre para examinar la relación entre la salud mental de los estudiantes universitarios y su desempeño académico. A través del análisis de dos fuentes de datos complementarias: datos individuales en formato CSV (5 100 registros) y estadísticas agregadas por carrera almacenadas en una base de datos SQLite (5 054 registros distribuidos en 3 tablas); se busca identificar patrones, factores de riesgo y perfiles estudiantiles que permitan diseñar intervenciones oportunas y basadas en evidencia.

### Objetivos del Proyecto

- **General:** Desarrollar una aplicación de IA que analice la relación entre salud mental y rendimiento académico estudiantil usando librerías de software libre.
- **Específicos:**
  - Recolectar, limpiar y transformar datos provenientes de dos fuentes distintas (CSV y SQLite).
  - Generar visualizaciones descriptivas e interactivas con Matplotlib, Bokeh y PygWalker.
  - Construir modelos predictivos (clasificación y clustering) usando Scikit-learn.
  - Identificar los factores con mayor influencia en la aparición de problemas de salud mental.

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
  - `read_csv()` — Carga del dataset CSV (5 100 filas × 15 columnas).
  - `read_sql()` — Consultas SQL directamente a la base de datos SQLite, incluyendo JOINs entre las 3 tablas.
  - `groupby()`, `agg()` — Agregaciones estadísticas por carrera y año.
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
- **Corrección aplicada:** Las columnas de tipo `int64` se convierten a `float64` antes de pasarlas a `pyg.walk()` para evitar el error `InvalidInputException: BIGINT -> BLOB` causado por incompatibilidad con DuckDB (motor interno de PygWalker). Se trabaja sobre una copia del DataFrame (`df.copy()`) para no afectar los modelos de ML.
- **Uso en el proyecto:** Exploración libre e interactiva de ambos datasets para descubrimiento de patrones.
- **Licencia:** Apache-2.0.

### 2.6 Scikit-learn

**Scikit-learn** es la librería más completa de Machine Learning para Python. Provee implementaciones eficientes y bien documentadas de algoritmos de clasificación, regresión, clustering y reducción de dimensionalidad.

- **Algoritmos utilizados:**
  - `RandomForestClassifier` — Clasificación de riesgo de salud mental. Accuracy obtenido: **63.5%**.
  - `LogisticRegression` — Clasificación lineal de referencia (baseline). Accuracy obtenido: **66.0%**.
  - `KMeans` — Clustering no supervisado para identificar 4 perfiles estudiantiles.
  - `StandardScaler` — Normalización de variables numéricas (media=0, desviación estándar=1).
  - `train_test_split` — División 75% entrenamiento / 25% prueba con `stratify=y`.
- **Licencia:** BSD-3-Clause.

### 2.7 SQLite

**SQLite** es un motor de base de datos relacional embebido, sin servidor, ampliamente utilizado en aplicaciones de escritorio, móviles y ciencia de datos. Python incluye soporte nativo mediante el módulo `sqlite3`.

- **Uso en el proyecto:** Almacenamiento de estadísticas agregadas por carrera universitaria. La base de datos cuenta con 56 carreras de universidades ecuatorianas, 4 774 registros de estadísticas por año de estudio y 224 registros de recursos de bienestar.

---

## 3. Descripción del Dataset Usado

### 3.1 Dataset Principal — `student_mental_health.csv`

| Atributo | Descripción |
|---|---|
| **Origen** | Dataset sintético generado con distribuciones estadísticas basadas en literatura de salud mental universitaria (Eisenberg et al., 2013; Rotenstein et al., 2016) |
| **Formato** | CSV (Comma-Separated Values) |
| **Registros** | 5 100 estudiantes universitarios (100 originales + 5 000 generados) |
| **Variables** | 15 variables originales + 8 variables derivadas (dataset final) |
| **IDs** | S0001 – S5100 |

**Variables del dataset original:**

| Variable | Tipo | Descripción |
|---|---|---|
| `student_id` | Categórica | Identificador único del estudiante |
| `age` | Numérica | Edad en años (18–23) |
| `gender` | Categórica | Género (Male/Female) — distribución 50/50 |
| `year_of_study` | Numérica | Año de carrera (1–3) |
| `cgpa` | Numérica | Promedio académico acumulado (2.1–4.0, media=3.69) |
| `depression` | Binaria | Diagnóstico de depresión (Yes/No) — 26.0% afirmativo |
| `anxiety` | Binaria | Diagnóstico de ansiedad (Yes/No) — 31.9% afirmativo |
| `panic_attack` | Binaria | Ataques de pánico (Yes/No) — 14.9% afirmativo |
| `sought_treatment` | Binaria | Buscó tratamiento profesional (Yes/No) — 14.0% afirmativo |
| `sleep_hours` | Numérica | Horas de sueño por noche (3–9, media=6.43) |
| `study_hours_per_day` | Numérica | Horas de estudio diarias (1–8, media=3.99) |
| `social_media_hours` | Numérica | Horas en redes sociales/día (1–12) |
| `physical_activity` | Ordinal | Nivel de actividad física (Low/Moderate/High) |
| `academic_pressure` | Ordinal | Percepción de presión académica (Low/Moderate/High) |
| `family_support` | Ordinal | Apoyo familiar percibido (Low/Moderate/High) |

**Variables derivadas (generadas durante el preprocesamiento):**

| Variable | Descripción |
|---|---|
| `wellbeing_index` | Índice compuesto de bienestar (media=2.31, std=0.46) |
| `mental_health_issue` | Variable objetivo: 1 si tiene depresión O ansiedad — 43.4% afirmativo |
| `physical_activity_num` | Codificación ordinal: Low=0, Moderate=1, High=2 |
| `academic_pressure_num` | Codificación ordinal: Low=0, Moderate=1, High=2 |
| `family_support_num` | Codificación ordinal: Low=0, Moderate=1, High=2 |
| `gender_num` | Codificación binaria: Female=0, Male=1 |
| `mental_status` | Etiqueta textual: 'Sin Problemas' / 'Con Problemas' |
| `cluster` | Perfil K-Means asignado (0–3) |

**Estadísticas descriptivas clave (n=5 100):**

| Métrica | Valor |
|---|---|
| CGPA promedio | 3.69 |
| Tasa de depresión | 26.0% |
| Tasa de ansiedad | 31.9% |
| Tasa de ataques de pánico | 14.9% |
| Buscan tratamiento | 14.0% |
| Estudiantes con al menos un problema | 43.4% |
| Horas sueño promedio | 6.43 h |
| Horas estudio promedio | 3.99 h |

---

### 3.2 Dataset Secundario — `academic_performance.db` (SQLite)

| Atributo | Descripción |
|---|---|
| **Origen** | Base de datos relacional creada para el proyecto |
| **Formato** | SQLite (.db) |
| **Tablas** | 3 tablas relacionadas |
| **Total registros** | 5 054 (56 + 4 774 + 224) |
| **Script SQL** | `create_database.sql` (300 245 caracteres, 5 372 líneas) |
| **Script Python** | `crear_base_datos.py` — genera el .db desde el .sql |

**Estructura relacional:**

```
carreras (56 registros)
    ├── estadisticas_carrera (4 774 registros)
    └── recursos_bienestar (224 registros)
```

**Tabla `carreras` (56 registros):**

| Campo | Tipo | Descripción |
|---|---|---|
| `carrera_id` | INTEGER PK | Identificador único (1–56) |
| `nombre` | TEXT | Nombre de la carrera e institución |
| `facultad` | TEXT | Facultad a la que pertenece |
| `duracion_anos` | INTEGER | Duración en años (4, 5 o 6) |

Las 6 carreras originales son:

| ID | Carrera | Facultad | Duración |
|---|---|---|---|
| 1 | Ingeniería en Sistemas | Ingeniería | 5 años |
| 2 | Medicina | Ciencias de la Salud | 6 años |
| 3 | Derecho | Ciencias Sociales | 5 años |
| 4 | Psicología | Ciencias Humanas | 4 años |
| 5 | Administración de Empresas | Ciencias Económicas | 4 años |
| 6 | Arquitectura | Arte y Diseño | 5 años |

Las 50 carreras adicionales (IDs 7–56) corresponden a programas de universidades ecuatorianas reales, entre ellas: Universidad Técnica del Norte, Escuela Politécnica Nacional, Universidad de Guayaquil, PUCE, USFQ, Universidad Salesiana, Universidad del Azuay, Universidad Técnica de Ambato, Yachay Tech, entre otras.

**Tabla `estadisticas_carrera` (4 774 registros):**

| Campo | Tipo | Descripción |
|---|---|---|
| `stat_id` | INTEGER PK | Identificador único |
| `carrera_id` | INTEGER FK | Referencia a carreras |
| `anio_estudio` | INTEGER | Año académico (1–4) |
| `promedio_cgpa` | REAL | CGPA promedio (rango: 2.36–4.00) |
| `tasa_depresion` | REAL | Tasa de depresión % (rango: 5.0–54.5%) |
| `tasa_ansiedad` | REAL | Tasa de ansiedad % |
| `tasa_busca_ayuda` | REAL | Tasa que busca ayuda % |
| `promedio_suenio` | REAL | Horas de sueño promedio |
| `promedio_estudio` | REAL | Horas de estudio promedio |
| `num_estudiantes` | INTEGER | Número de estudiantes en la cohorte |

**Tabla `recursos_bienestar` (224 registros):**

| Campo | Tipo | Descripción |
|---|---|---|
| `recurso_id` | INTEGER PK | Identificador único |
| `carrera_id` | INTEGER FK | Referencia a carreras |
| `tipo_recurso` | TEXT | Tipo: Psicológico, Académico, Social, Físico |
| `nombre` | TEXT | Nombre del recurso |
| `disponible` | INTEGER | 1=Disponible, 0=No disponible |

Distribución por tipo: 56 recursos Psicológicos + 56 Académicos + 56 Sociales + 56 Físicos = 224 totales.

### 3.3 Dataset Final — `student_mental_health_final.csv`

El dataset final es el resultado del pipeline completo de preprocesamiento aplicado al CSV original. Contiene **5 100 registros y 23 columnas**: las 15 originales más las 8 variables derivadas (`wellbeing_index`, `mental_health_issue`, `mental_status`, `cluster`, y las 4 codificaciones numéricas).

---

## 4. Descripción de los Pasos Realizados en el Proyecto

### Paso 0: Configuración del Entorno

Se instalaron las librerías necesarias mediante pip y se configuró Jupyter Lab como entorno de trabajo principal. Se creó la siguiente estructura de directorios:

```
ai_project/
├── data/
│   ├── student_mental_health.csv        # Dataset inicial CSV (5 100 registros)
│   ├── academic_performance.db          # Base de datos SQLite (5 054 registros)
│   ├── student_mental_health_final.csv  # Dataset final enriquecido (23 columnas)
│   └── viz_*.png                        # 5 visualizaciones Matplotlib exportadas
├── notebooks/
│   └── analisis_salud_mental_IA.ipynb   # Notebook principal (8 secciones)
└── sql/
    ├── create_database.sql              # Script SQL completo (5 372 líneas)
    └── crear_base_datos.py              # Script Python generador del .db
```

### Paso 1: Carga de Datos

**Dataset CSV:** `pd.read_csv('../data/student_mental_health.csv')` cargó los datos individuales de 5 100 estudiantes en un DataFrame de 15 columnas sin valores nulos.

**Dataset SQLite:** Se estableció conexión con `sqlite3.connect()` y se usó `pd.read_sql()` para cargar las tres tablas. Se ejecutó un JOIN entre `estadisticas_carrera` y `carreras` para obtener un DataFrame enriquecido de 4 774 filas × 11 columnas con nombre de carrera, facultad y todas las métricas estadísticas.

La inspección inicial con `.info()`, `.describe()` e `.isnull().sum()` confirmó integridad total: 0 valores nulos en ambos datasets.

### Paso 2: Preprocesamiento

Se realizaron 4 transformaciones sobre el dataset CSV:

1. **Codificación binaria:** Variables Yes/No → 1/0 en `depression`, `anxiety`, `panic_attack`, `sought_treatment`.
2. **Codificación ordinal:** Low/Moderate/High → 0/1/2 en `physical_activity`, `academic_pressure`, `family_support`. También `gender` → Female=0, Male=1.
3. **Ingeniería de características:** Creación del `wellbeing_index` como combinación ponderada: `sleep_hours×0.3 + physical_activity_num×0.2 + family_support_num×0.2 − depression×0.15 − anxiety×0.15`. Media resultante: 2.31.
4. **Variable objetivo:** `mental_health_issue` = 1 si `depression==1` OR `anxiety==1`. Resultado: 43.4% de estudiantes con al menos un problema.

### Paso 3: Visualizaciones con Matplotlib

Se generaron 5 figuras multi-panel con 15 subgráficos en total, guardadas en PNG a 150 DPI.

### Paso 4: Visualizaciones con Bokeh

Se generaron 3 visualizaciones 100% interactivas embebidas en el notebook con HoverTool, zoom, pan y filtros por leyenda.

### Paso 5: Exploración con PygWalker

Se inicializó PygWalker sobre ambos DataFrames con conversión previa de `int64` a `float64` para compatibilidad con DuckDB. Permite exploración drag-and-drop sin código.

### Paso 6: Modelos de IA

**Clasificación (6.1):**
- División 75/25 con `stratify=y` sobre 5 100 registros → 3 825 entrenamiento / 1 275 prueba
- `RandomForestClassifier` (100 árboles, `class_weight='balanced'`) → **Accuracy: 63.5%**
- `LogisticRegression` (`max_iter=500`, datos escalados) → **Accuracy: 66.0%**
- Variables más predictivas según Random Forest: `social_media_hours`, `cgpa`, `study_hours_per_day`

**Clustering (6.2):**
- K-Means con k=4 seleccionado por método del codo sobre 5 variables escaladas
- 4 perfiles estudiantiles identificados:

| Perfil | CGPA | Sueño | Estudio | Redes | Bienestar | % con prob. mental |
|---|---|---|---|---|---|---|
| Perfil 1 | 3.83 | 7.12h | 4.47h | 2.73h | 2.62 | 29% |
| Perfil 2 | 3.84 | 7.19h | 2.73h | 5.44h | 2.61 | 28% |
| Perfil 3 | 3.41 | 5.75h | 3.61h | 4.93h | 1.99 | 60% |
| Perfil 4 | 3.65 | 5.42h | 5.09h | 2.47h | 1.91 | 60% |

Los perfiles 1 y 2 representan estudiantes con buen descanso y bienestar elevado. Los perfiles 3 y 4 presentan déficit de sueño y bajo bienestar, con el doble de probabilidad de problema de salud mental.

### Paso 7: Exportación del Dataset Final

Se exportó `student_mental_health_final.csv` con 5 100 registros y 23 columnas, listo para análisis posteriores o reutilización en otros proyectos.

---

## 4.1 Descripción de las Visualizaciones Generadas

### Matplotlib
![Distribución General](https://raw.githubusercontent.com/lmegas1/TrabajoFinal/main/data/viz_matplotlib_distribucion.png)
**Figura 1: Distribución General del Dataset (cuadrícula 2×3)**

Seis subgráficos que ofrecen una vista panorámica del dataset de 5 100 estudiantes. El histograma CGPA muestra concentración entre 3.5 y 4.0 con media 3.69. El pastel de género refleja distribución exactamente balanceada (50/50). Las barras por año muestran 1 771 (año 1), 1 784 (año 2) y 1 545 (año 3) estudiantes. El histograma de sueño evidencia que la media de 6.43h está por debajo del mínimo recomendado de 8h. Las barras horizontales de salud mental muestran ansiedad (31.9%) superando a depresión (26.0%), con bajo porcentaje buscando tratamiento (14.0%). El scatter CGPA vs horas de estudio, coloreado por actividad física, muestra que alta actividad física se asocia con CGPA más alto.

### Matplotlib
![Distribución General](https://raw.githubusercontent.com/lmegas1/TrabajoFinal/main/data/viz_matplotlib_correlacion.png)
**Figura 2: Mapa de Correlación y Box Plot (1×2)**

El mapa de calor de 13 variables numéricas revela que `family_support_num` correlaciona positivamente con `cgpa` y negativamente con `depression`; `social_media_hours` correlaciona negativamente con `sleep_hours` y `cgpa`; `academic_pressure_num` es el predictor negativo más fuerte del CGPA. El box plot confirma diferencia significativa de CGPA entre estudiantes sin problema (mediana ≈3.8) y con problema (mediana ≈3.5).

### Matplotlib
![Distribución General](https://raw.githubusercontent.com/lmegas1/TrabajoFinal/main/data/viz_matplotlib_carreras.png)
**Figura 3: Análisis por Carrera — Dataset SQLite (2×2)**

Cuatro gráficos sobre las 6 carreras originales: líneas de evolución CGPA (Psicología mantiene el CGPA más estable); barras horizontales de depresión con gradiente RdYlGn (Medicina supera 40% en años avanzados, Psicología es la de menor incidencia); líneas punteadas de ansiedad por año; gráfico de burbuja con 4 dimensiones simultáneas (sueño, estudio, número de estudiantes y CGPA como color).

### Matplotlib
![Distribución General](https://raw.githubusercontent.com/lmegas1/TrabajoFinal/main/data/viz_matplotlib_modelos.png)
**Figura 4: Resultados de Modelos de IA (1×3)**

Importancia de variables del Random Forest (top 3: redes sociales, CGPA, horas de estudio), y matrices de confusión para Random Forest (Blues) y Regresión Logística (Oranges) comparando predicciones contra valores reales del conjunto de prueba (1 275 estudiantes).

### Matplotlib
![Distribución General](https://raw.githubusercontent.com/lmegas1/TrabajoFinal/main/data/viz_matplotlib_clustering.png)
**Figura 5: K-Means Clustering (1×2)**

Método del codo (k=2 a k=8) con línea roja marcando k=4 seleccionado, y scatter CGPA vs wellbeing_index con 4 colores diferenciados (azul, verde, naranja, rosado) representando los 4 perfiles estudiantiles sobre los 5 100 puntos.

### Bokeh — Scatter Interactivo
**Gráfico 1: CGPA vs Índice de Bienestar**

Scatter con puntos verdes (sin problema) y rojos (con problema), tooltips que muestran ID, CGPA, bienestar, sueño, estudio y estado al pasar el cursor. Leyenda clickeable para filtrar grupos.

### Bokeh — Barras Agrupadas Interactivas
**Gráfico 2: Tasas de Salud Mental por Carrera**

Barras agrupadas (depresión, ansiedad, búsqueda de ayuda) para cada carrera del SQLite con tooltips de valor exacto al hover.

### Bokeh — Líneas Interactivas
**Gráfico 3: Evolución CGPA por Año y Carrera**

Seis líneas de colores (una por carrera), tooltips con CGPA, tasa de depresión y horas de sueño. Leyenda interactiva para ocultar/mostrar series individualmente.

### PygWalker — Exploradores Interactivos (×2)
**Exploradores 1 y 2: Análisis Drag-and-Drop**

Interfaz visual sobre el CSV (5 100 filas, 23 columnas tras preprocesamiento) y sobre el SQLite (4 774 filas, 11 columnas). Permite crear cualquier tipo de gráfico sin código. Requiere conversión previa de columnas `int64` a `float64` para compatibilidad con DuckDB.

---

## 5. Conclusiones

### 5.1 Conclusiones sobre los Datos

1. **Alta prevalencia de problemas de salud mental:** El 43.4% de los 5 100 estudiantes presenta al menos depresión o ansiedad. Esta cifra supera los promedios históricos reportados en literatura y exige atención institucional urgente.

2. **Impacto directo en el rendimiento académico:** Los estudiantes con problemas de salud mental presentan un CGPA mediano inferior al de sus pares sin dichos problemas (≈3.5 vs ≈3.8), diferencia consistente en todos los años de estudio y géneros.

3. **Factores protectores clave:** El apoyo familiar, las horas de sueño adecuadas y la actividad física emergen como los tres factores con mayor poder protector, confirmado tanto por la matriz de correlación como por la importancia de variables del Random Forest.

4. **Factores de riesgo principales:** Las redes sociales (`social_media_hours`) resultaron ser la variable más predictiva del problema de salud mental según Random Forest, seguidas por el CGPA y las horas de estudio. El uso excesivo de redes sociales correlaciona negativamente con sueño y CGPA.

5. **Dos perfiles de alto riesgo identificados:** Los perfiles 3 y 4 del clustering (sueño < 6h, bienestar_index < 2.0) presentan un 60% de incidencia de problema de salud mental, el doble que los perfiles 1 y 2 (≈28-29%).

6. **Diferencias entre carreras:** Medicina supera el 40% de tasa de depresión en años avanzados. Psicología muestra las tasas más bajas. La carga de horas de estudio en Medicina y Arquitectura se asocia con menor sueño y mayor ansiedad.

7. **Brecha crítica de acceso a tratamiento:** Solo el 14% de los estudiantes con síntomas busca tratamiento profesional, evidenciando una brecha de atención que requiere programas de reducción del estigma.

### 5.2 Conclusiones sobre las Herramientas

8. **Pandas demostró ser indispensable** para la integración de dos fuentes heterogéneas. La capacidad de ejecutar JOINs SQL directamente con `read_sql()` simplificó enormemente el pipeline.

9. **Matplotlib y Bokeh son complementarios:** Matplotlib para figuras de alta resolución exportables (150 DPI); Bokeh para exploración interactiva en el notebook con tooltips y filtros sin JavaScript adicional.

10. **Los modelos de IA son herramientas de apoyo:** Random Forest (63.5%) y Regresión Logística (66.0%) ofrecen capacidad predictiva útil pero moderada, apropiada para un problema con alta varianza humana.

12. **K-Means reveló perfiles accionables:** Los 4 perfiles estudiantiles permiten diseñar intervenciones diferenciadas: los perfiles 3 y 4 requieren intervención prioritaria en hábitos de sueño; el perfil 2 (alto uso de redes sociales) necesita estrategias de desconexión digital.

### 5.3 Reflexión Final

Considero que este proyecto demuestra que es posible construir un pipeline completo de análisis de datos con IA (desde la recolección hasta la predicción y clustering) utilizando exclusivamente software libre, sin costo alguno y con resultados de alta calidad. La combinación de Jupyter Lab, Pandas, Matplotlib, Bokeh, PygWalker y Scikit-learn constituye un stack tecnológico robusto, accesible y alineado con las mejores prácticas de la ciencia de datos reproducible.

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

13. **Breiman, L.** (2001). *Random Forests*. Machine Learning, 45(1), 5–32. https://doi.org/10.1023/A:1010933404324

14. **MacQueen, J.** (1967). *Some methods for classification and analysis of multivariate observations*. Proceedings of the 5th Berkeley Symposium on Mathematical Statistics and Probability, 1, 281–297.