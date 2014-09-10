{%
  set run_on = {
    "CentOS": ("6",)
  }
%}

{% set source_dir = "/testing" %}
{% set additional_args = "" %}
{% set python = "python" %}

{% if grains["os"] in run_on %}

  {% if grains["os"] == "CentOS" %}

    {% if grains["osmajorrelease"] in run_on[grains["os"]] %}

    {% set platform = "CentOS" %}
    {% set additional_args = "--spec={{ source_dir }}/tests/pkg/rpm/salt.spec" %}

    {% endif %}

  {% endif %}

{% endif %}


{% if platform != None %}
run_buildpackage:
  cmd:
    - run
    - name: '{{ python }} {{ source_dir }}/tests/buildpackage.py --platform={{ platform }} --log-level=debug --source-dir={{ source_dir }} --dest-dir=/tmp/saltpkg {{ additional_args }}'
{% endif %}
