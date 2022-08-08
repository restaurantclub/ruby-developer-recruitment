# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

## Seeding data

```
$ rails db:seed
```


## Rails & GraphQL Excersises:


### Problem #1 - Potential performance issue

There's a performance problem potentially lying in such a query. Find it and fix it.

```graphql
zones {
    id
    name
    restaurants {
        id
        name
    }
}
```

(or in CURL) 

```bash
curl --location --request POST 'http://localhost:3000/graphql' \
     --header 'Content-Type: application/json' \
     --data-raw '{"query":"query {\n    zones {\n        id\n        name\n        restaurants {\n            id\n            name\n        }\n    }\n}","variables":{}}' | jq .
```

### Problem #2 - Add pagination to graph query, using GraphQL edges.
We'd like to use pagination, while fetching restaurants. Provide such possibility

### Problem #3 Introduce adding and deleting restaurants via API
Add mutations for adding/deleting restaurants and zones (add tests to prove they work)

### Problem #4 No searching by restaurant name

Modify `restaurants` query in such a way to let it filter restaurants by name