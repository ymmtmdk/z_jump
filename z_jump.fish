set -g Z_SCRIPT_PATH /usr/local/etc/profile.d/z.sh

function z_jump.check --on-variable PWD --description 'Setup z on directory change'
  status --is-command-substitution; and return
  bash -c "source $Z_SCRIPT_PATH; _z --add `pwd -P`"
end

function z_jump -d "jump around"
  cd (bash -c "source $Z_SCRIPT_PATH; _z $argv; echo \$PWD")
end
