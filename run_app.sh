#!/bin/bash

set -e

print_usage() {
      echo "Usage:"
      echo "    -c: clean"
      echo "    -r: run after build"
      echo "    any other: print this help"
}

get_flags() {
      # https://stackoverflow.com/questions/7069682/how-to-get-arguments-with-flags-in-bash

      while getopts 'cr' flag; do
            case "${flag}" in
                  c) flag_clean=true ;;
                  r) flag_run=true ;;
                  *) print_usage
                        exit 1 ;;
            esac
      done
}

clean() {
      if [ "$flag_clean" = true ]; then
            # force regenerate project files
            rm -rf ./build/*
      fi
}

generate() {
      mkdir -p ./build
      cd ./build

      cmake -S .. \
            -B .  \
            -G Ninja
}

run() {
      if [ "$flag_run" = true ]; then
            echo ""
            echo ""
            ./adam
      fi
}

main() {
      flag_clean=false
      flag_run=true
      get_flags $@

      clean
      generate
      ninja -j4 # build
      run
}

main $@
