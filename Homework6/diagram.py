from diagrams import Diagram, Cluster
from diagrams.onprem.monitoring import Prometheus
from diagrams.onprem.monitoring import Grafana
from diagrams.onprem.database import MySQL

with Diagram("Web Service", show=False):
	with Cluster("VM1"):
    		MySQL("MySQL") >> Prometheus("Prometheus") >> Grafana("Grafana")
	with Cluster("VM2"):
		MySQL("MySQL") >> Prometheus("Prometheus") >> Grafana("Grafana")

