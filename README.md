# Normalización de Base de Datos 📚



## Gestión de Entrenamientos y Eventos Deportivos 🏃🏻‍♂️

Un club de fútbol amateur desea implementar una aplicación de gestión integral para organizar sus actividades de entrenamiento y sus eventos deportivos tanto internos como amistosos contra otros equipos. El sistema debe permitir registrar las distintas sedes y complejos deportivos donde se llevan a cabo sesiones de entrenamiento, así como planificar programas de preparación física y técnica orientados a diferentes categorías de jugadores. Cada programa de entrenamiento incluirá un calendario de sesiones, objetivos específicos y seguimiento individual de métricas de rendimiento.

Paralelamente, el club organiza torneos y partidos amistosos que requieren coordinar la disponibilidad de jugadores, árbitros y comisarios, además de gestionar patrocinios y voluntarios colaboradores. Para ello, la base de datos deberá reflejar la programación de encuentros, la asignación de personal, las acciones tomadas ante incidencias durante los partidos y los recursos necesarios (equipamiento y mantenimiento de canchas). Será necesario manejar información sobre participantes, fechas, ubicaciones y estados de cada evento, de modo que se puedan generar reportes de asistencia y estadísticas de desempeño.

Dado el alto grado de interdependencia entre atletas, programas de entrenamiento, eventos y patrocinios, se contemplará el uso de tablas intermedias para representar relaciones muchos a muchos (por ejemplo, jugadores inscritos en varios programas o eventos patrocinados por diversas entidades). Estas tablas auxiliares garantizarán la integridad referencial y facilitarán la aplicación de las reglas de negocio.

### Rúbrica

| Criterio                                      | 0 pts (Insuficiente)                              | 50 pts (Aceptable)                                           | 100 pts (Excelente)                                          | Ponderación |
| --------------------------------------------- | ------------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ----------- |
| **Identificación de Entidades y Atributos**   | Faltan entidades clave o atributos esenciales.    | Incluye la mayoría de las entidades, pero omite alguno de los atributos relevantes. | Todas las entidades principales y secundarias están presentes con atributos adecuados y tipos de datos coherentes. | 35 %        |
| **Definición de Relaciones y Cardinalidades** | Relaciones incompletas o cardinalidades erróneas. | Relaciones definidas, pero con alguna cardinalidad o clave foránea mal planteada. | Relaciones correctas con cardinalidades adecuadas (1–N, N–M) y claves foráneas claras. | 20 %        |
| **Normalización mínima en 3FN**               | Datos repetidos y dependencias no clave.          | Eliminadas redundancias simples, pero persisten dependencias parciales. | Cumple estrictamente 3FN: cada atributo depende solo de la PK de su tabla, sin redundancias. | 20 %        |
| **Diagrama ER en StarUML**                    | Ausente o ilegible.                               | Diagrama correcto pero con notación inconsistente o poco claro. | Diagrama limpio, legible, notación estándar UML, exportación a imagen y archivo de proyecto. | 25 %        |
