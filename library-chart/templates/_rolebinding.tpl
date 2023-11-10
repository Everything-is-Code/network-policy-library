{{ define "library-chart.rolebinding" }}
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: {{ .Release.Name }}-rolebinding
  namespace: {{ .Values.namespace.name }}
subjects:
  - kind: ServiceAccount
    name: {{ .Release.Name }}-sa
roleRef:
  kind: Role
  name: {{ .Release.Name }}-role
  apiGroup: rbac.authorization.k8s.io
{{- end }}