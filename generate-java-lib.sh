#!/bin/bash

set -e

if [ $# -ne 3 ]; then
    echo "usage: $0 <yaml-file> <package-name> <dest-dir>"
    exit 1
fi

yaml_file=${1}
package=${2}
dest_dir=${3}

java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i $yaml_file -l java --api-package $package -o /home/java-client-lib
chmod 755 /home/java-client-lib/gradlew
cd /home/java-client-lib
./gradlew build
cp build/libs/*.jar $2

