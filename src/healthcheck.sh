#!/bin/sh

name_file_script='hello-world.sh'
path_dir_script=$(cd $(dirname $0); pwd)
path_file_script="${path_dir_script}/${name_file_script}"

echo 'Healthcheck: '
$path_file_script > /dev/null
if [ $? -ne 0 ]; then
  echo '  * Failed'
  exit 1
fi

echo '  - OK'
exit 0
