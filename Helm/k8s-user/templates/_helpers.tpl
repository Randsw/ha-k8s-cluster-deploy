{{/*
Expand the name of the chart.
*/}}
{{- define "k8s_user.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "k8s_user.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "k8s_user.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "k8s_user.labels" -}}
helm.sh/chart: {{ include "k8s_user.chart" . }}
{{ include "k8s_user.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "k8s_user.selectorLabels" -}}
app.kubernetes.io/name: {{ include "k8s_user.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "k8s_user.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "k8s_user.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create role from values
*/}}
{{- define "k8s_user.roles" -}}
{{- range  .rules }}  
{{- range $key, $value := . }}
{{- if eq $key "apiGroups" }}
- {{ $key }}:
{{- else }}
  {{ $key }}:
{{- end }}
{{- range $value }}
{{- if empty . }}
  - {{ . | toString | squote }}
{{- else }}
  - {{ . }}
{{- end }}
{{- end }}
{{- end }} 
{{- end }}  
{{- end }}

{{/*
Create cluster role from values
*/}}
{{- define "k8s_user.clusterRoles" -}}
{{- range  .Values.ns_admin_cluster_role.rules }}
{{- range $key, $value := . }}
{{- if eq $key "apiGroups" }}
- {{ $key }}:
{{- else }}
  {{ $key }}:
{{- end }}
{{- range $value }}
{{- if empty . }}
  - {{ . | toString | squote }}
{{- else }}
  - {{ . }}
{{- end }}
{{- end }}
{{- end }} 
{{- end }}  
{{- end }}