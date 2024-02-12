from diagrams import Diagram, Cluster
from diagrams.onprem.compute import Server
from diagrams.onprem.database import MySQL
from diagrams.onprem.monitoring import Prometheus, Grafana
from diagrams.onprem.network import Internet

with Diagram("Step-project", show=False):
    with Cluster("Local Network Bridge - eno1"):
        with Cluster("VM1"):
            vm1 = Server("vm1")
            mysql = MySQL("MySQL")
            sql_exporter = Prometheus("Prometheus MySQL Exporter")
            node_exporter = Prometheus("Node Exporter")

            vm1 - sql_exporter
            sql_exporter - mysql
            vm1 - node_exporter

        with Cluster("VM2"):
            vm2 = Server("vm2")
            prometheus = Prometheus("Prometheus")
            grafana = Grafana("Grafana")

            vm1 - prometheus
            vm1 - grafana

        internet = Internet("Web-interfaces")
        alertmanager = Internet("Alertmanager")
        vm2 - alertmanager
        grafana - internet
        prometheus - internet
