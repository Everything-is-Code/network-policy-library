{{ define "library-chart.configmap" }}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-index-html-configmap
  namespace: {{ .Values.namespace.name }}
data:
  index.html: |
    <html>
    <h1>Welcome</h1>
    </br>
    <h1>Hi! I got deployed in {{ .Values.env.name }} Environment using Helm Chart {{ .Chart.Name }}-{{ .Chart.Version }} from Library library-chart:1.0.7  </h1>
    </html
{{- end }}