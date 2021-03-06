{% if grains['os'] not in ('Windows',) %}
include:
  - python.pip
{% endif %}

pyvmomi:
  pip.installed:
    - name: pyvmomi
    {%- if salt['config.get']('virtualenv_path', None)  %}
    - bin_env: {{ salt['config.get']('virtualenv_path') }}
    {%- endif %}
    {%- if salt['config.get']('pip_target', None)  %}
    - target: {{ salt['config.get']('pip_target') }}
    {%- endif %}
{% if grains['os'] not in ('Windows',) %}
    - require:
      - cmd: pip-install
{% endif %}
