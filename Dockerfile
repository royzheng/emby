FROM emby/embyserver:4.8.8.0
LABEL maintainer="Roy Zheng"
LABEL version="4.8.8.0"
LABEL description="EmbyServer"

COPY system /system
ENV LANG=en_US.UTF-8 \
    HOME=/tmp \
    AMDGPU_IDS=/share/libdrm/amdgpu.ids \
    FONTCONFIG_PATH=/etc/fonts \
    LD_LIBRARY_PATH=/lib:/system \
    LIBVA_DRIVERS_PATH=/lib/dri \
    OCL_ICD_VENDORS=/etc/OpenCL/vendors \
    PCI_IDS_PATH=/share/hwdata/pci.ids \
    SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt \
    UID=2 \
    GID=2 \
    GIDLIST=2 \
    NVIDIA_VISIBLE_DEVICES=all \
    NVIDIA_DRIVER_CAPABILITIES=compute,video,utility \
    IGNORE_VAAPI_ENABLED_FLAG=false \
    XDG_CACHE_HOME=/config/cache
VOLUME [/config]
EXPOSE 1900/udp
EXPOSE 7359/udp
EXPOSE 8096/tcp
EXPOSE 8920/tcp
ENTRYPOINT ["/init"]


