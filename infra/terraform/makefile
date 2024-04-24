.PHONY: plan
plan:
	@echo "Plan"
	terraform plan

.PHONY: apply
apply:
	@echo "Apply"
	terraform apply

.PHONY: push
push:
	docker push $(DOCKER_REGISTRY)/frontend:$(shell git rev-parse --short HEAD)

.PHONY: redeploy-backend
redeploy-backend:
	@echo "Redeploying the backend container"
	terraform taint google_compute_instance.backend && terraform apply --auto-approve
