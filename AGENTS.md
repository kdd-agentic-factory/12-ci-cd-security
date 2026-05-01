# AGENTS.md

Guia para agentes y colaboradores que modifiquen este repositorio.

## Objetivo del repositorio

Mantener activos reutilizables para CI/CD, seguridad y calidad:

- Workflows de GitHub Actions.
- Politicas organizativas.
- Configuraciones de scanners.
- Plantillas de colaboracion.

## Convenciones

- Mantener los ejemplos genericos y parametrizables.
- Documentar cualquier supuesto importante dentro del archivo correspondiente.
- Preferir configuraciones seguras por defecto.
- Evitar secretos, tokens o valores internos reales.
- Usar YAML valido y Markdown claro.

## Validacion antes de entregar cambios

- Revisar que los workflows no dependan de rutas inexistentes sin fallback.
- Comprobar que los scanners tengan una configuracion minima usable.
- Mantener las politicas alineadas con revisiones obligatorias, trazabilidad y
  gestion de secretos.

## Estilo

- Markdown en espanol claro.
- Nombres de archivos estables y descriptivos.
- Cambios pequenos, revisables y orientados a reutilizacion.
