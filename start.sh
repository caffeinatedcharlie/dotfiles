#!/usr/bin/env bash
set -eux
CONFNAME=$1

rm -rf ./result
rm -rf ./${CONFNAME}.qcow2
nix build .#nixosConfigurations.${CONFNAME}.config.system.build.vm
# Horrible hack to force it to use the system QEMU to allow OpenGL to work. Please never ever do this.
# sed "s/\/nix\/store\/.*qemu-kvm/qemu-system-x86_64/g" ./result/bin/run-${CONFNAME}-vm | bash
./result/bin/run-${CONFNAME}-vm