# Branch Protection Policy

## Objetivo

Proteger las ramas principales para asegurar revision, trazabilidad y calidad
antes de publicar cambios.

## Alcance

Aplica a ramas `main`, `master`, `release/*` y cualquier rama protegida por el
equipo de plataforma.

## Requisitos minimos

- Pull request obligatorio antes de fusionar.
- Al menos una aprobacion de un revisor distinto del autor.
- Checks obligatorios de CI, seguridad y calidad.
- Conversaciones resueltas antes del merge.
- Historial lineal o squash merge segun el estandar del repositorio.
- Bloqueo de force push y eliminacion de ramas protegidas.

## Excepciones

Las excepciones deben estar justificadas en un issue o incidente, aprobadas por
un responsable tecnico y documentadas despues del cambio.
