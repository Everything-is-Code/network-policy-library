{{ define "library-chart.egress_wpodselector" }}
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