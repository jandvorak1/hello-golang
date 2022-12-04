.PHONY: clean build

build:	
	@echo "Executing build..."
	@CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags "-s -w" -o build/linux-amd64/ cmd/gohelloworld/gohelloworld.go	
	@CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -ldflags "-s -w" -o build/windows-amd64/ cmd/gohelloworld/gohelloworld.go	
	@CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -ldflags "-s -w" -o build/darwin-amd64/ cmd/gohelloworld/gohelloworld.go	

clean:	
	@echo "Executing clean..."
	@go clean
	@rm -rf build/*

run:
	@go run cmd/gohelloworld/gohelloworld.go

test:
	@echo "Executing test..."
	@go test ./internal/...
