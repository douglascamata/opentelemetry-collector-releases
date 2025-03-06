# escape=`
ARG WIN_VERSION=2019
FROM mcr.microsoft.com/windows/servercore:ltsc${WIN_VERSION}

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

COPY --chmod=755 otelcol-otlp.exe ./otelcol-otlp.exe

ENV NO_WINDOWS_SERVICE=1

ENTRYPOINT ["otelcol-otlp.exe"]
EXPOSE 4317 4318
