package main

import "errors"

func main() {

}

var storage = make(map[string]string)

func Put(key string, value string) error {
	storage[key] = value
	return nil
}

var ErrorNoSuchKey = errors.New("no such key")

func Get(key string) (string, error) {
	value, ok := storage[key]
	if !ok {
		return "", ErrorNoSuchKey
	}
	return value, nil
}

func Delete(key string) error {
	delete(storage, key)
	return nil
}
