include:
  - .core
  - ...restart.mon.lax
  - ...restart.osd.lax
  - ...restart.mgr.lax

populate mgr scrape configs:
  salt.state:
    - tgt: {{ salt['master.minion']() }}
    - tgt_type: compound
    - sls: ceph.monitoring.prometheus.populate_mgr_scrape_configs

distribute mgr scrape configs:
  salt.state:
    - tgt: 'I@roles:prometheus and I@cluster:ceph'
    - tgt_type: compound
    - sls: ceph.monitoring.prometheus.push_mgr_scrape_configs
