.PHONY: run

build:
	go build -o build/service cmd/service/main.go

run:
	go run cmd/service/main.go

update:
	find ./cmd -mindepth 0 -maxdepth 1 -type d | sort | egrep -v '(.git|.idea|vendor)' | \
    while read DIR; do \
      echo "${DIR}"; \
      cd "${DIR}"; \
      go get -u; \
      go mod tidy; \
      go mod vendor; \
      cd -; \
    done