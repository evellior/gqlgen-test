package models

import (
	"encoding/json"
	"io"

	"github.com/99designs/gqlgen/graphql"
)

func MarshalAny(b interface{}) graphql.Marshaler {
	return graphql.WriterFunc(func(w io.Writer) {
		json.NewEncoder(w).Encode(b)
	})
}

func UnmarshalAny(v interface{}) (interface{}, error) {
	return v, nil
}
