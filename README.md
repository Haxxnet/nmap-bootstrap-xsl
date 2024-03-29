<div align="center" width="100%">
    <h1>nmap-bootstrap-xsl</h1>
    <p>An Nmap XSL implementation with Bootstrap.<br>Allows Nmap XML port scan results to be converted into beautiful HTML reports.</p><p>
    <a target="_blank" href="https://haxxnet.github.io/nmap-bootstrap-xsl/report.html">> Demo HTML Report <</a><p>
    <a target="_blank" href="https://github.com/l4rm4nd"><img src="https://img.shields.io/badge/maintainer-LRVT-orange" /></a>
    <a target="_blank" href="https://GitHub.com/Haxxnet/nmap-bootstrap-xsl/graphs/contributors/"><img src="https://img.shields.io/github/contributors/Haxxnet/nmap-bootstrap-xsl.svg" /></a><br>
    <a target="_blank" href="https://GitHub.com/Haxxnet/nmap-bootstrap-xsl/commits/"><img src="https://img.shields.io/github/last-commit/Haxxnet/nmap-bootstrap-xsl.svg" /></a>
    <a target="_blank" href="https://GitHub.com/Haxxnet/nmap-bootstrap-xsl/issues/"><img src="https://img.shields.io/github/issues/Haxxnet/nmap-bootstrap-xsl.svg" /></a>
    <a target="_blank" href="https://github.com/Haxxnet/nmap-bootstrap-xsl/issues?q=is%3Aissue+is%3Aclosed"><img src="https://img.shields.io/github/issues-closed/Haxxnet/nmap-bootstrap-xsl.svg" /></a><br>
        <a target="_blank" href="https://github.com/Haxxnet/nmap-bootstrap-xsl/stargazers"><img src="https://img.shields.io/github/stars/Haxxnet/nmap-bootstrap-xsl.svg?style=social&label=Star" /></a>
    <a target="_blank" href="https://github.com/Haxxnet/nmap-bootstrap-xsl/network/members"><img src="https://img.shields.io/github/forks/Haxxnet/nmap-bootstrap-xsl.svg?style=social&label=Fork" /></a>
    <a target="_blank" href="https://github.com/Haxxnet/nmap-bootstrap-xsl/watchers"><img src="https://img.shields.io/github/watchers/Haxxnet/nmap-bootstrap-xsl.svg?style=social&label=Watch" /></a><p>
    <a href="https://www.buymeacoffee.com/LRVT" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>
</div>

## 🔥 Features

- Bootstrap Datatable filters and search bars
- Export functionality like Copy, CSV, Excel and PDF
- Automatic classification of web network services to a separate audit space with clickable HTTP/HTTPS URLs
- Nmap CLI flag explanation via https://explainshell.com
- Dynamic keyword highlighting via JS (e.g. keywords like password, login, insecure)
- Quick glance at HTTP titles and SSL certificate information (CN, Expiry etc.)
- Hostname and IP address listing of scan targets
- Indication for encrypted network services (plaintext vs. SSL/STARTTLS)
- Links to 3rd party services such as a CVE database by Pentest Factory, an SSL scan service by Qualys and an HTTP security header scan service by securityheaders.com
    
## ✨ Requirements
- xsltproc — command line xslt processor

````
sudo apt install xsltproc
````

## 🎓 Usage

### Converting Nmap XML

You can convert an already existing Nmap XML file into a nicely formatted HTML report by executing the following commands:

````
# download the nmap bootstrap xsl
wget https://raw.githubusercontent.com/Haxxnet/nmap-bootstrap-xsl/main/nmap-bootstrap.xsl

# convert your nmap xml file into html
xsltproc -o report.html nmap-bootstrap.xsl <nmap.xml>
````

The resulting Nmap HTML report `report.html` can be directly opened with any web browser of your choice. 

### Applying XSL in advance

If you have not yet started your Nmap port scan, you can also apply the bootstrap XSL in your Nmap CLI command as follows:

````
nmap -sS -Pn --stylesheet https://raw.githubusercontent.com/Haxxnet/nmap-bootstrap-xsl/main/nmap-bootstrap.xsl scanme.nmap.org
````

The resulting Nmap XML file can be directly opened with a supported web browser. The bootstrap XSL will already be applied.

> **Note**:
> Nonetheless, it is recommended to convert the XML file into an HTML report. This ensures that the final Nmap bootstrap report is supported by all web browsers and that clients, to which you'll hopefully send your port scanning results, can easily categorize and open the file with the default OS application - a web browser.

## 💎 Acknowledgment & Credits

Many thanks to the following individuals:

- ❤ [honze-net](https://github.com/honze-net) for [nmap-bootstrap-xsl](https://github.com/honze-net/nmap-bootstrap-xsl)
