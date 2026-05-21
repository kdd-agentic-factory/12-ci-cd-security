.PHONY: test scan-secrets validate-compose render-kustomize release-notes sbom help

help:
	@echo "Available targets:"
	@echo "  test              Run structural validation tests"
	@echo "  scan-secrets      Run Gitleaks secret scan"
	@echo "  validate-compose  Validate Docker Compose file"
	@echo "  render-kustomize  Render Kustomize overlay"
	@echo "  release-notes     Generate release notes"
	@echo "  sbom              Generate SBOM for IMAGE_REF"

test:
	pytest -q tests/

scan-secrets:
	bash scripts/scan-secrets.sh

validate-compose:
	bash scripts/validate-compose.sh ../10-infra-docker/docker-compose.yml

render-kustomize:
	bash scripts/render-kustomize.sh ../11-infra-kubernetes/overlays/local

release-notes:
	bash scripts/generate-release-notes.sh 0.1.0

sbom:
ifndef IMAGE_REF
	$(error IMAGE_REF is not set. Usage: make sbom IMAGE_REF=ghcr.io/org/image:tag)
endif
	bash scripts/generate-sbom.sh $(IMAGE_REF)

version:
	bash scripts/generate-version.sh

promote-staging:
ifndef IMAGE_NAME
	$(error IMAGE_NAME is not set. Usage: make promote-staging IMAGE_NAME=my-service)
endif
	bash scripts/promote-to-staging.sh $(IMAGE_NAME)

collect-metrics:
	bash scripts/collect-ci-metrics.sh
