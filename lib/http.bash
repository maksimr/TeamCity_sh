export http_Request="curl"

# @param {string} headerName
# @param {string} headerValue
# @return {List} The list with two elements
http_createHeader() {
    headerName="$1"
    headerValue="$2"

    echo $headerName
    echo $headerValue
}

# @param {string} hostName
# @param {List...} [headerName, headerValue]
http_request() {
  hostName="$1"
  requestHeaders=()

  shift 1

  if [ "$http_Request" ];
  then

    while [ "$#" -gt 0 ];
    do
      requestHeaders=("${requestHeaders[@]}" "-H")
      requestHeaders=("${requestHeaders[@]}" "$1: $2")

      shift 1
      shift 1
    done

    $http_Request $hostName "${requestHeaders[@]}"
  else
    echo 'Error(http): You should define `http_Request` variable'
  fi
}
