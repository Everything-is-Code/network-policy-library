{{ define "library-chart.egress" }}
  egress:
    - ports:
        - protocol: {{ .Values.networking.egress.protocol}}
          port: {{ .Values.networking.egress.port}}
      from:
        - podSelector: {{ .Values.networking.egress.podSelector}}
          namespaceSelector:
            matchLabels:
              kubernetes.io/metadata.name: {{ .Values.networking.egress.namespaceSelector}}
{{- end }}