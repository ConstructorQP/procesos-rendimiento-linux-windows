#!/usr/bin/env bash
# Resumen rápido del estado de un servidor Linux para localizar cuellos de botella.
# Reúne los comandos usados en la práctica: carga, CPU, memoria, disco,
# procesos que más consumen y servicios habilitados.
set -uo pipefail

echo "== Carga y tiempo encendido =="; uptime
echo; echo "== Núcleos de CPU =="; nproc
echo; echo "== Memoria =="; free -h
echo; echo "== Disco raíz =="; df -h /
echo; echo "== Top 5 por CPU =="; ps aux --sort=-%cpu | head -n 6
echo; echo "== Top 5 por memoria =="; ps aux --sort=-%mem | head -n 6
echo; echo "== Servicios habilitados al arranque =="; systemctl list-unit-files --type=service --state=enabled --no-pager | head -n 20
echo; echo "== Paquetes con actualización pendiente =="; apt list --upgradable 2>/dev/null | tail -n +2 | wc -l
