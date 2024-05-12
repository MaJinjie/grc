#!/usr/bin/env zsh

if ! tty -s || [ ! -n "$TERM" ] || [ "$TERM" = dumb ]; then
  return
fi

local cmd cmds

0=${${(M)${(%):-%N}:#/*}:-${0:A}}
# Supported commands
cmds=(
  as
  ant
  blkid
  cc
  configure
  curl
  cvs
  df
  diff
  dig
  dnf
  docker
  docker-compose
  docker-machine
  du
  env
  fdisk
  findmnt
  free
  g++
  gas
  gcc
  getfacl
  getsebool
  gmake
  id
  ifconfig
  iostat
  ip
  iptables
  iwconfig
  journalctl
  kubectl
  last
  ldap
  lolcat
  ld
  ls
  lsattr
  lsblk
  lsmod
  lsof
  lspci
  make
  mount
  mtr
  mvn
  netstat
  nmap
  ntpdate
  php
  ping
  ping6
  proftpd
  ps
  sar
  semanage
  sensors
  showmount
  sockstat
  ss
  stat
  sysctl
  systemctl
  tcpdump
  traceroute
  traceroute6
  tune2fs
  ulimit
  uptime
  vmstat
  wdiff
  whois
)
# Set alias for available commands.
for cmd in ${cmds:|GRC_NO_CMDS} ; do
  if (( $+commands[$cmd])) && ((! $+aliases[$cmd] || GRC_OVERRIDE)) ; then
        alias $cmd="grc -- $commands[$cmd]"
    fi
done

# Clean up variables
unset cmds cmd
