{{ define "network-policy-library.ingress" }}
  ingress:
    - ports:
        - protocol: {{ .Values.networking.ingress.protocol}}
          port: {{ .Values.networking.ingress.port}}
{{- end }}