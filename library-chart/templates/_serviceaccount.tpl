{{ define "library-chart.serviceaccount" }}
apiVersion: v1
kind: ServiceAccount
metadata:
  name: {{ .Release.Name }}-sa
  namespace: {{ .Values.namespace.name }}
  labels:
    app: nginx
{{- end }}