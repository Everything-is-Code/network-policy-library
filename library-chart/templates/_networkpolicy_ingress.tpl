{{ define "library-chart.ingress" }}
  ingress:
    - ports:
        - protocol: {{ .Values.networking.ingress.protocol}}
          port: {{ .Values.networking.ingress.port}}
      from:
        - podSelector: {{ .Values.networking.ingress.podSelector}}
          namespaceSelector:
            matchLabels:
              kubernetes.io/metadata.name: {{ .Values.networking.ingress.namespaceSelector}}
{{- end }}