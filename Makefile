.PHONY: install
install:
	@echo "Installing..."
	go install github.com/bombsimon/wsl/v4/cmd...@v4.4.1
	go install mvdan.cc/gofumpt@v0.6.0
	go install github.com/daixiang0/gci@v0.13.4

.PHONY: fmt
fmt:
	@echo "Formatting..."
	go mod tidy
	go fmt ./...
	gci write -s standard -s default -s "prefix(github.com/SecurityBrewery/catalyst)" .
	gofumpt -l -w .
	wsl -fix ./... || true
	cd ui && bun format

.PHONY: lint
lint:
	golangci-lint version
	golangci-lint run  ./...

.PHONY: test
test:
	@echo "Testing..."
	go test -v ./...
	cd ui && bun test

.PHONY: test-coverage
test-coverage:
	@echo "Testing with coverage..."
	go test -coverpkg=./... -coverprofile=coverage.out -count 1 ./...
	go tool cover -func=coverage.out
	go tool cover -html=coverage.out

.PHONY: build-ui
build-ui:
	@echo "Building..."
	cd ui && bun install
	cd ui && bun build-only

.PHONY: dev
dev:
	@echo "Running..."
	rm -rf catalyst_data
	go run . bootstrap
	go run . admin create admin@catalyst-soar.com 1234567890
	go run . set-feature-flags dev
	go run . fake-data
	go run . serve

.PHONY: dev-ui
serve-ui:
	cd ui && bun dev --port 3000
