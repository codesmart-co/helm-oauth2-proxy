{{- define "oauth2-proxy-mesh.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "oauth2-proxy-mesh.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- include "oauth2-proxy-mesh.name" . -}}
{{- end -}}
{{- end -}}

{{- define "oauth2-proxy-mesh.labels" -}}
app.kubernetes.io/name: {{ include "oauth2-proxy-mesh.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "oauth2-proxy-mesh.selectorLabels" -}}
app.kubernetes.io/name: {{ include "oauth2-proxy-mesh.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
