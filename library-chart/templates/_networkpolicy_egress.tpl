{{ define "network-policy-library.egress" }}
  egress:
    - ports:
        - protocol: {{ .Values.networking.egress.protocol}}
          port: {{ .Values.networking.egress.port}}
{{- end }}