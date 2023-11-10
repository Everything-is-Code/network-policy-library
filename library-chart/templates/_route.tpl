{{ define "library-chart.route" }}
{{- if .Values.global.cluster.ocp }}
apiVersion: route.openshift.io/v1
kind: Route
metadata:
  name: {{ .Release.Name }}-route
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
