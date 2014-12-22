#!/bin/bash

require() {
  currentDir="$(cd $(dirname ${BASH_SOURCE[0]:-$0}); pwd)"
  extensionName="${2:-bash}"
  source "$currentDir/$1.$extensionName"
}
