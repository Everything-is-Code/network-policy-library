{{ define "library-chart.networkpolicy" }}
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: {{ .Release.Name }}-{{ .Values.networkpolicy.name}}
spec:
  podSelector: {{ .Values.networkpolicy.spec.podselector }}
  {{ if .Values.networking.spec.ingress }}
    {{ - include "library-chart.ingress" . | nident 4 }}
  {{ end }}
  {{ if .Values.networking.spec.ingress_wpodselector }}
    {{ - include "library-chart.ingress" . | nident 4 }}
  {{ end }}
  {{ if .Values.networkpolicy.spec.egress }}
    {{ - include "library-chart.egress" . | nident 4 }}
  {{ end }}
  {{ if .Values.networkpolicy.spec.egress_wpodselector }}
    {{ - include "library-chart.egress" . | nident 4 }}
  {{ end }}
  policyType: {{ .Values.networkpolicy.spec.policytypes }}
{{- end }}