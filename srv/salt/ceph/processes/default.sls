wait for all processes:
  module.run:
    - name: cephprocesses.wait
    - fire_event: True
    - failhard: True
