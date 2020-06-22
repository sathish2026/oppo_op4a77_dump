#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:bbde7367676714a4497e0789159a1df2dd47c549; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:e20225f3ebe25f8e923938d15da1681b2e54a4e8 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:bbde7367676714a4497e0789159a1df2dd47c549 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
