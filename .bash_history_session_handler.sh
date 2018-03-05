#!/bin/sh

# Bash History Session Handler

# save in home and include in '~/.bashrc'
#. ~/.bash_history_session_handler.sh # note the dot and space

# What:
# - Updates each terminal with commands of all terminals for
#   reverse searching from any terminal (ctrl +r)
# - while keeping the 'per-session commands' at the end of its
#   own histfile to access with Up-Down arrows.
# Why:
# - Because history commands are insufficient to achieve all of the above.
# How:
# - Updates 'shared histfile' from all sessions, reads it to
#   'per-session histfile' then reads 'per-session commands' to it.

DEFAULT_HISTFILE=${HISTFILE}
TTY_HISTFILE_FOLDER=${HOME}/.bhsh_tty/
mkdir -p ${TTY_HISTFILE_FOLDER}
TTY_HISTFILE=${TTY_HISTFILE_FOLDER}/bhsh_tty`basename $(tty)`
SESS_HISTFILE=${TTY_HISTFILE}_session
cp /dev/null ${SESS_HISTFILE}

clear_hist_list(){ history -c;}
append_new_to_file(){ history -a;}
read_file_to_list(){ history -r;}
write_list_to_file(){ history -w;}

set_file_to_session(){ HISTFILE=${SESS_HISTFILE};}
set_file_to_default(){ HISTFILE=${DEFAULT_HISTFILE};}
set_file_to_tty(){ HISTFILE=${TTY_HISTFILE};}

prompt_cmd() {
  set_file_to_session
  append_new_to_file

  LAST_SESS=$(tail -n 1 ${SESS_HISTFILE})
  LAST_HIST=$(tail -n 1 ${DEFAULT_HISTFILE})

  if [[ ${LAST_SESS} != ${LAST_HIST} && ${LAST_SESS} != '' ]]
    then echo ${LAST_SESS} >> ${DEFAULT_HISTFILE}
  fi
  clear_hist_list

  set_file_to_default
  read_file_to_list

  set_file_to_session
  read_file_to_list

  set_file_to_tty
  write_list_to_file
}
PROMPT_COMMAND="prompt_cmd;$PROMPT_COMMAND"

on_exit_tty(){ rm ${TTY_HISTFILE}{,_session};}
trap on_exit_tty EXIT

# ~Radivarig
