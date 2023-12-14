{{ define "network-policy-library.networkpolicy" }}
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: {{ .Release.Name }}-{{ .Values.networkpolicy.name}}
spec:
  podSelector: {{ .Values.networkpolicy.spec.podselector }}
{{- if .Values.networking.spec.ingress }}
  {{ include "network-policy-library.ingress" }}
{{ end }}
{{- if .Values.networking.spec.ingress_wpodselector }}
  {{ include "network-policy-library.ingress" }}
{{ end }}
{{- if .Values.networkpolicy.spec.egress }}
  {{ include "network-policy-library.egress" }}
{{ end }}
{{- if .Values.networkpolicy.spec.egress_wpodselector }}
  {{ include "network-policy-library.egress" }}
{{ end }}
  policyType: {{ .Values.networkpolicy.spec.policytypes }}
{{- end }}