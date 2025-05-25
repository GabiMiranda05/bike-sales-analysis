# 📊 Análisis de Ventas — Servicio de Bicicletas

Este proyecto analiza los datos de una empresa de bicicletas compartidas, permitiendo a los usuarios alquilar bicicletas por períodos cortos.  
El dataset incluye información detallada sobre el uso del servicio, costos, registros de alquiler por hora y condiciones externas como el clima y días festivos.

**Archivo original:** Formato CSV  
**Herramientas utilizadas:** SQL Server, Power BI

---

## 🧩 Problemática — Cliente Interno

El cliente interno solicitó el desarrollo de un dashboard para **Toman Bike Share** que muestre los principales indicadores de rendimiento para la toma de decisiones informadas.

### Requerimientos:

- Análisis de ingresos por hora  
- Tendencias de ingresos y ganancias  
- Ingresos estacionales  
- Demografía de los usuarios  
- Recomendación sobre el aumento de precios para el próximo año

---

## 🛠️ Extracción y Transformación de Datos en SQL

Para construir el dashboard en Power BI, se realizaron consultas en SQL que estructuraron la información clave en una tabla lista para su análisis.

1. **Uso de CTE (Common Table Expression):** Se creó una CTE llamada `cte` que combina los datos de las tablas `bike_share_yr_0` y `bike_share_yr_1` mediante `UNION ALL`, consolidando la información de ambos años.
2. **Selección de datos relevantes:** Se extrajeron columnas clave como `dteday`, `season`, `rider_type`, `riders`, `price` y `COGS`.
3. **Cálculo de métricas financieras:** Se generaron dos nuevas columnas:  
   - **Revenue:** `riders * price`  
   - **Profit:** `revenue - COGS`
4. **Unión con la tabla de costos (`cost_table`):** Se utilizó un `LEFT JOIN` para combinar los datos de la CTE con la tabla de costos, asegurando que cada registro tenga la información de costos correspondiente al año (`yr`).

---

## 📈 Importación de Datos en Power BI

Los datos obtenidos con la consulta en SQL Server fueron importados a Power BI utilizando la opción de conexión a SQL Server.  
Esto permitió ejecutar la consulta directamente en la base de datos y trasladar automáticamente la tabla generada al entorno de Power BI sin necesidad de transformaciones adicionales.

---

## 📐 Creación de Métricas en Power BI

Para el análisis del rendimiento financiero, se creó una medida en Power BI que calcula el margen de ganancia a partir de los ingresos (`revenue`) y las ganancias (`profit`).

### Medida creada:

```DAX
Margen de ganancia = 
    (SUM(Consulta1[revenue]) - SUM(Consulta1[profit])) 
    / SUM(Consulta1[revenue])
```
---

## 📊 Visualizaciones Creadas

- Ingresos promedio por hora  
- Ganancia neta por tipo de usuario  
- Estacionalidad (ingresos por temporada)  
- Distribución de usuarios por categoría  
- Margen de ganancia general y por tipo de usuario  

> Las visualizaciones permiten identificar patrones de uso, oportunidades de aumento de precios y rendimiento por segmento.

---

## ✅ Conclusiones

- El servicio es **rentable en general**, con un buen margen operativo.  
- Los **usuarios registrados generan mayor rentabilidad**, ya que el costo operativo por alquiler es más bajo en ese segmento.  
- Existe **estacionalidad clara**: primavera y verano presentan los ingresos más altos.  
- Se recomienda un **ajuste de precios para el siguiente año**, especialmente en horarios y estaciones de mayor demanda.

---

## 📎 Recursos del Proyecto

- Consulta SQL original: `consulta_etl.sql`  
- Archivo Power BI: `dashboard.pbix`  
- Capturas del dashboard: `/images`  
- Este `README.md` como documentación del proyecto

---

## 🧠 Aprendizajes

- Aplicación práctica de SQL para el modelado de datos.  
- Uso de medidas DAX para análisis financiero.  
- Diseño de dashboards con enfoque en toma de decisiones.  
- Desarrollo de documentación técnica para compartir proyectos.

---

