{{ define "network-policy-library.networkpolicy" }}
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: {{ .Release.Name }}-{{ .Values.networkpolicy.name}}
spec:
  podSelector: {{ .Values.networkpolicy.spec.podselector }}
  {{- if .Values.networkpolicy.enabled.ingress }}
  ingress:
    {{- range .Values.networkpolicy.spec.ingress }}
    - ports:
        - protocol: {{ .protocol }}
          port: {{ .port }}
      {{- if .from.enabled }} 
      from:
        - podSelector: {{ .from.podSelector }}
            matchLabels:
              kubernetes.io/metadata.name: {{ .from.podSelector }}
      {{ end }}  
    {{ end }}
  {{ end }}
  {{- if .Values.networkpolicy.enabled.egress }}
  egress:
    {{- range .Values.networkpolicy.spec.egress }}
    - ports:
        - protocol: {{ .protocol }}
          port: {{ .port }}
    {{- if .to.enabled }}
      to:
        - namespaceSelector:
            matchLabels:
              kubernetes.io/metadata.name: {{ .to.namespaceSelector }}
      {{ end }}
    {{ end }}
  {{ end }}
  policyTypes: 
  {{- if .Values.networkpolicy.enabled.ingress }}
    - Ingress
  {{ end }}
  {{- if .Values.networkpolicy.enabled.egress }}
    - Egress
  {{ end }}
{{- end }}