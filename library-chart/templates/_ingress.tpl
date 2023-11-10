{{ define "library-chart.ingress" }}
{{- if .Values.global.cluster.aws }}
apiVersion: route.openshift.io/v1
kind: Route
metadata:
  name: {{ .Release.Name }}-ingress
  namespace: {{ .Values.namespace.name }}
  labels:
    app: nginx
spec:
  port:
    targetPort: {{ .Values.service.targetPort }}
  to:
    kind: Service
    name: {{ .Release.Name }}-service
    weight: 100
{{- end }}
{{- end }}