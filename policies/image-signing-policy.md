# Image Signing Policy

## Objetivo

Garantizar integridad y procedencia de las imagenes de contenedor publicadas.

## Requisitos

- Firmar imagenes publicadas en registros corporativos.
- Verificar firma antes de desplegar en entornos compartidos o productivos.
- Publicar SBOM cuando el pipeline lo permita.
- Asociar imagenes a commit, workflow y repositorio de origen.
- Bloquear imagenes con vulnerabilidades criticas sin excepcion aprobada.

## Herramientas recomendadas

- Cosign para firma y verificacion.
- Trivy para vulnerabilidades y SBOM.
- GitHub OIDC para evitar secretos persistentes de firma.
