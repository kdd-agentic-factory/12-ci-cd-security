# Secret Management Policy

## Objetivo

Evitar la exposicion de credenciales y asegurar que los secretos se gestionan
con controles auditables.

## Reglas

- No guardar secretos en Git, issues, logs o artefactos de CI.
- Usar gestores de secretos aprobados por la organizacion.
- Rotar credenciales ante cualquier sospecha de exposicion.
- Usar secretos de GitHub Actions solo con el minimo alcance necesario.
- Revisar permisos de tokens periodicamente.
- Ejecutar deteccion de secretos en pull requests y en escaneos programados.

## Respuesta ante exposicion

1. Revocar o rotar el secreto.
2. Evaluar impacto y accesos realizados.
3. Eliminar la referencia del historial cuando sea necesario.
4. Documentar el incidente y las medidas preventivas.
