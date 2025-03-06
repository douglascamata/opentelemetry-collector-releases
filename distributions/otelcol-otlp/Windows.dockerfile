# escape=`
ARG WIN_VERSION=2019
FROM mcr.microsoft.com/windows/servercore:ltsc${WIN_VERSION}

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

COPY --chmod=755 otelcol-otlp.exe ./otelcol-otlp.exe
COPY config.yaml ./config.yaml

ENV NO_WINDOWS_SERVICE=1

ENTRYPOINT ["otelcol-otlp.exe"]
CMD ["--config", "config.yaml"]
EXPOSE 4317 4318
