{{ define "network-policy-library.networkpolicy" }}
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: {{ .Release.Name }}-{{ .Values.networkpolicy.name}}
spec:
  podSelector: {{ .Values.networkpolicy.spec.podselector }}
  {{- if .Values.networkpolicy.spec.ingress.enabled }}
    {{- range .Values.networkpolicy.spec.ingress }}
  ingress:
    - ports:
        - protocol: {{ .protocol}}
          port: {{ .port}}
      {{- if .from.enabled }} 
      from:
        - podSelector: {{ .podSelector}}
            matchLabels:
              kubernetes.io/metadata.name: {{ .podSelector}}
      {{ end }}  
    {{ end }}
  {{ end }}
  {{- if .Values.networkpolicy.spec.egress }}
  egress:
    - ports:
        - protocol: {{ .protocol}}
          port: {{ .port}}
    {{- if .to.enabled }}
      to:
        - namespaceSelector:
            matchLabels:
              kubernetes.io/metadata.name: {{ .namespaceSelector}}
    {{ end }}
  {{ end }}
  policyTypes: 
  {{- if .Values.networkpolicy.enabled.ingress }}
    - Ingress
  {{ end }}
  {{- if .Values.networkpolicy.enabled.egress }}
    - Egress
  {{ end }}
{{ end }}
{{- end }}