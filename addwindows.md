> TODO: Automatizar este processo

- Verificar qual a partição efi

```sh
sudo fdisk -l
```

- Supondo que a partição efi seja a nvme0n1p1, modifique se for outra

```sh
sudo blkid /dev/nvme0n1p1\n
```

- Obtenha o UUID da partição

- Adicione :

```sh
menuentry "Windows X" {
     insmod ntfs
     search --fs-uuid --no-floppy --set=UUID #Troque UUID pelo resultado anterior
     chainloader (${root})/efi/Microsoft/Boot/bootmgfw.efi
}
```

- No arquivo 40_custom:

```sh
sudo nvim /etc/grub.d/40_custom
```

- Gere novamente o arquivo de configuração grub:

```sh
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

- Tá pronto o sorvetinho

```sh
reboot
```
