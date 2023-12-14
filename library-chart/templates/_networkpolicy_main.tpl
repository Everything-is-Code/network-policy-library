{{ define "network-policy-library.networkpolicy" }}
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: {{ .Release.Name }}-{{ .Values.networkpolicy.name}}
spec:
{{- range .Values.networkpolicy }}
  podSelector: {{ .spec.podselector }}
  {{- if .spec.ingress.enabled }}
  ingress:
    - ports:
        - protocol: {{ .spec.ingress.protocol}}
          port: {{ .spec.ingress.port}}
    {{- if .spec.ingress.from.enabled }} 
      from:
        - podSelector: {{ .spec.ingress.podSelector}}
            matchLabels:
              kubernetes.io/metadata.name: {{ .spec.ingress.podSelector}}
    {{ end }}  
  {{ end }}
  {{- if .spec.egress }}
  egress:
    - ports:
        - protocol: {{ .spec.egress.protocol}}
          port: {{ .spec.egress.port}}
    {{- if .spec.egress.to.enabled }}
      to:
        - namespaceSelector:
            matchLabels:
              kubernetes.io/metadata.name: {{ .spec.egress.namespaceSelector}}
    {{ end }}
  {{ end }}
  policyTypes: 
  {{- if .spec.ingress.enabled }}
    - Ingress
  {{ end }}
  {{- if .spec.egress }}
    - Egress
  {{ end }}
{{ end }}
{{- end }}