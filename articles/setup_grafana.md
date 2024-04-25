# Tutorial for Grafana

## Steps on your server/local machine

### Prometheus
1. Head to Prometheus Download page https://prometheus.io/download/
2. Download "prometheus" LTS version for your OS
3. Unpack the folder
4. Open the prometheus.yml with a text editor
5. Add following lines to the end of your file:
```yml
- job_name: "altv"
  static_configs:
    - targets: ["localhost:7797"]
```
6. Save the file
7. Open a console (PowerShell whatever)
8. Run prometheus (.exe) and keep it running

### alt:V Server
1. Head to your server.toml
2. Open it with a text editor
3. Add or edit following line:
```toml
[worldProfiler]
port = 7797
host = "0.0.0.0"
```
4. Open a console (PowerShell whatever)
5. Start the server and keep it running

## Steps in browser

### Grafana (Cloud):
1. Create an account on Grafana: https://grafana.com/auth/sign-up/create-user?pg=login
2. Setup your vanity URL (e.g. PROJECTNAME.grafana.net)
3. On your vanity URL, click on the burger icon next to home
4. Open the dropdown of "Connections"
5. Click on Data sources
6. Click on "Add new data source" at the top right
7. Select Prometheus
8. Give it a name
9. Enter the IPv4 of the server (if local, your IPv4) [Google: "What's my IP"]
10. Scroll down and click on "Save&Test"
11. If successfully, click on "Build a dashboard" at the top right corner
12. Click on "Import a dashboard"
13. Enter 20241 in the input field and click on Load
14. Select the data source you created just before
15. Click on Import

### Grafana (self-hosted):
1. On your vanity URL, click on the burger icon next to home
2. Open the dropdown of "Connections"
3. Click on Data sources
4. Click on "Add new data source" at the top right
5. Select Prometheus
6. Give it a name
7. Enter the IPv4 of the server (if local, your IPv4) [Google: "What's my IP"]
8. Scroll down and click on "Save&Test"
9. If successfully, click on "Build a dashboard" at the top right corner
10. Click on "Import a dashboard"
11. Enter 20241 in the input field and click on Load
12. Select the data source you created just before
13. Click on Import

If you have a static server IPv4, you can add users to your Grafana dashboard to share data with your team.