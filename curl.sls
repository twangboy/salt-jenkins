{%- if grains['os'] == 'Gentoo' %}
  {% set curl = 'net-misc/curl' %}
{% else %}
  {% set curl = 'curl' %}
{%- endif %}

{%- if grains['os'] == 'openSUSE' %}
include:
  - ca-certificates-mozilla
{%- endif %}

curl:
  pkg.installed:
    - name: {{ curl }}
    {%- if grains['os'] == 'openSUSE' %}
    - require:
      - pkg: ca-certificates-mozilla
    {%- endif %}