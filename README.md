# 12-ci-cd-security

Repositorio de CI/CD, seguridad y calidad.

Este repositorio centraliza workflows, politicas, plantillas y configuraciones
de scanners para industrializar la organizacion. La idea es que los equipos
puedan copiar, referenciar o adaptar estos activos de forma consistente en sus
proyectos.

## Contenido

- `github-actions/`: workflows base para CI de Python, build de Docker,
  validacion de Kubernetes, seguridad, documentacion y construccion de papers.
- `policies/`: politicas operativas para ramas, pull requests, secretos y firma
  de imagenes.
- `scanners/`: configuraciones de herramientas de seguridad y calidad.
- `templates/`: plantillas de issues y pull requests.

## Uso recomendado

1. Copiar el workflow necesario desde `github-actions/` al repositorio destino,
   normalmente dentro de `.github/workflows/`.
2. Ajustar variables como nombre de imagen, version de Python, ruta de
   manifiestos o comandos de test.
3. Adoptar las politicas de `policies/` como criterio minimo de gobierno.
4. Mantener las configuraciones de `scanners/` versionadas y revisadas por el
   equipo de plataforma o seguridad.

## Principios

- Automatizar controles repetibles antes de fusionar cambios.
- Fallar temprano ante secretos, vulnerabilidades criticas o manifiestos
  invalidos.
- Producir evidencias trazables en CI.
- Usar plantillas comunes para mejorar la calidad de issues y pull requests.
