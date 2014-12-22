load ../lib/http

# Export global command
export http_Request="echo"

@test "http_createHeader: should create header" {
  run http_createHeader "Accept" "application/json"

  [ "${lines[0]}" = "Accept" ]
  [ "${lines[1]}" = "application/json" ]
}

@test "http_createHeader: should add two headers" {
  RequestHeaders=$(
    http_createHeader "Accept" "application/json"
    http_createHeader "Accept-Language" "en-US"
  )

  [ "$(echo $RequestHeaders)" = "Accept application/json Accept-Language en-US" ]
}

@test "http_request: should make request" {
  RequestHeaders=$(
    http_createHeader "Accept" "application/json"
    http_createHeader "Accept-Language" "en-US"
  )

  run http_request 'http://example.com' $RequestHeaders

  echo $output
  [ "$output" = "http://example.com -H Accept: application/json -H Accept-Language: en-US" ]
}
