{{ define "library-chart.namespace" }}
apiVersion: v1
kind: Namespace
metadata:
  labels:
    argocd.argoproj.io/managed-by: openshift-gitops
  name: {{ .Values.namespace.name }}
...
{{- end }}